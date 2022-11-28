import "reflect-metadata";

import { ApolloServer } from "apollo-server-micro";
import { buildSchema } from "type-graphql";

import { UsersResolver } from "../../schema/user/user.resolver";

const schema = await buildSchema({
  resolvers: [UsersResolver],
});

const server = new ApolloServer({
  schema,
});

export const config = {
  api: {
    bodyParser: false,
  },
};

const startServer = server.start();

export default async function handler(req, res) {
  await startServer;
  await server.createHandler({ path: '/api/gql' })(req, res);
}
