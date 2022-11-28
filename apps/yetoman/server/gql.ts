import gql from "graphql-tag";
import { useServer as wsUseServer } from "graphql-ws/lib/use/ws";
import http from "http";

import { ApolloServer } from "@apollo/server";
import { ApolloServerPluginDrainHttpServer } from "@apollo/server/plugin/drainHttpServer";
import { makeExecutableSchema } from "@graphql-tools/schema";

import { getPubSub, WebSocketServer } from "./ws";

// gql subscription trigger
const pubSub = getPubSub();

interface GqlContext {
  token?: string;
}

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
    createNewsEvent: (_parent, args: createNewsEventInput) => {
      console.log(args);
      pubSub.publish('EVENT_CREATED', { newsFeed: args });

      // Save news events to a database: you can do that here!

      // Create something : EVENT_CREATED
      // Subscribe to something: EVENT_CREATED
      return args;
    },
  },
  Subscription: {
    newsFeed: {
      subscribe: () => pubSub.asyncIterator(['EVENT_CREATED']),
    },
  },
};

const schema = makeExecutableSchema({ typeDefs, resolvers });

/**
 * Create an Apollo server
 * @param httpServer http server instance
 * @param wsServer web socket server instance
 * @returns apollo server instance
 */
export const createApolloServer = async (
  httpServer: http.Server,
  wsServer: WebSocketServer
): Promise<ApolloServer<GqlContext>> => {
  // get a web server dispose handler
  const wsDispose = wsUseServer({ schema }, wsServer).dispose;

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
              await wsDispose();
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

  await apolloServer.start();
  return apolloServer;
};
