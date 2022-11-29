import bodyParser from "body-parser";
import cors from "cors";
import express from "express";
import { createServer } from "http";
import next from "next";
import url from "url";

import { expressMiddleware } from "@apollo/server/express4";

import { environment } from "../environments/environment";
import { createApolloServer } from "./gql";
import { createWebSocket } from "./ws";

async function main() {
  // express app to handle the server requests
  const expressApp = express();

  // create a next app
  const nextApp = next({
    dev: !environment.production,
    dir: environment.buildDir,
    port: environment.port,
  });

  // next handle to process non-api requests
  const nextHandler = nextApp.getRequestHandler();

  await nextApp.prepare();

  // http server to handle request through express app
  const httpServer = createServer(expressApp);

  // web socket server to handle subscriptions
  const wsServer = createWebSocket({ server: httpServer, path: environment.gqlEndpoint });

  // apollo server to handle graphQL requests
  const gqlServer = await createApolloServer(httpServer, wsServer);

  // express app to handle request as per following options (gql)
  expressApp.use(
    environment.gqlEndpoint,
    cors<cors.CorsRequest>({
      credential: true,
    }),
    bodyParser.json({ limit: environment.gqlPayloadLimit }),
    expressMiddleware(gqlServer, {
      context: async ({ req }) => {
        return { token: req.headers.token };
      },
    })
  );

  expressApp.use((req, res, next) => {
    const parsedUrl = url.parse(req.url, true);
    const ignorePaths = [environment.gqlEndpoint, ...environment.rootAssets];
    if (!ignorePaths.includes(parsedUrl.path)) {
      nextHandler(req, res, parsedUrl);
    } else {
      next();
    }
  });

  httpServer.listen(environment.port, environment.hostname);

  console.log(`[ ready ] on http://${environment.hostname}:${environment.port}`);
}

main().catch((err) => {
  console.error(err);
  process.exit(1);
});
