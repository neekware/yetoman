import bodyParser from "body-parser";
import cors from "cors";
import express from "express";
import { PubSub } from "graphql-subscriptions";
import gql from "graphql-tag";
import { useServer as wsUseServer } from "graphql-ws/lib/use/ws";
import http from "http";
import { WebSocketServer } from "ws";

import { ApolloServer } from "@apollo/server";
import { expressMiddleware } from "@apollo/server/express4";
import { ApolloServerPluginDrainHttpServer } from "@apollo/server/plugin/drainHttpServer";
import { makeExecutableSchema } from "@graphql-tools/schema";

const GQL_PORT = 3000;
const GQL_ENDPOINT = '/api/gql';
const GQL_PAYLOAD_LIMIT = '50mb';
interface GqlContext {
  token?: string;
}

// Create an express app object
const expressApp = express();

// Create a server to handle incoming request destined to express
// This server needs to be drained to allow for graceful shutdown
const httpServer = http.createServer(expressApp);

// Create a subscription object
const pubsub = new PubSub();

// Create a WebSocket Server, bind it to httpServer on a path
const wsServer = new WebSocketServer({
  server: httpServer,
  path: GQL_ENDPOINT,
});

// Create GraphQL TypeDefs
const typeDefs = gql`
  type NewsEvent {
    title: String
    description: String
  }

  type Query {
    placeholder: Boolean
  }

  type Mutation {
    createNewsEvent(title: String, description: String): NewsEvent
  }

  type Subscription {
    newsFeed: NewsEvent
  }
`;

interface createNewsEventInput {
  title: string;
  description: string;
}

// Create GraphQL Resolvers
const resolvers = {
  Query: {
    placeholder: () => {
      return true;
    },
  },
  Mutation: {
    createNewsEvent: (_parent: any, args: createNewsEventInput) => {
      console.log(args);
      pubsub.publish('EVENT_CREATED', { newsFeed: args });

      // Save news events to a database: you can do that here!

      // Create something : EVENT_CREATED
      // Subscribe to something: EVENT_CREATED
      return args;
    },
  },
  Subscription: {
    newsFeed: {
      subscribe: () => pubsub.asyncIterator(['EVENT_CREATED']),
    },
  },
};

const schema = makeExecutableSchema({ typeDefs, resolvers });
const swServerDispose = wsUseServer({ schema }, wsServer);

// Create an Apollo server
const apolloServer = new ApolloServer<GqlContext>({
  schema,
  plugins: [
    ApolloServerPluginDrainHttpServer({ httpServer }),
    {
      async serverWillStart() {
        return {
          async drainServer() {
            console.log('\nDispose wsServer');
            await swServerDispose.dispose();
            console.log('Closing up wsServer');
            wsServer.close();
            console.log('Closing up httpServer');
            httpServer.close();
          },
        };
      },
    },
  ],
});

async function start(): Promise<void> {
  // Start Apollo Server
  await apolloServer.start();

  expressApp.use(
    GQL_ENDPOINT,
    cors<cors.CorsRequest>(),
    bodyParser.json({ limit: GQL_PAYLOAD_LIMIT }),
    expressMiddleware(apolloServer, {
      context: async ({ req }) => {
        return { token: req.headers.token };
      },
    })
  );

  // http server start
  httpServer.listen(GQL_PORT, () => {
    console.log(`Server running on http://localhost:${GQL_PORT}${GQL_ENDPOINT})`);
  });
}

start();
