import { join as pathJoin } from "path";

// - The environment variable is set by `@nrwl/next:server` when running the dev server.
// - The fallback `__dirname` is for production builds.
const buildDir = process.env.NX_NEXT_DIR || pathJoin(__dirname, '..');
const production = process.env.NODE_ENV === 'development';
const hostname = process.env.HOST || 'localhost';
const port = process.env.PORT ? parseInt(process.env.PORT) : 3000;

export const environment = {
  siteName: 'yeToman',
  prefix: 'yetoman',
  siteUrl: `http://:${hostname}:${port}`,
  siteSupportEmail: 'support@yetoman.net',
  production,
  buildDir,
  hostname,
  port,
  gqlEndpoint: '/api/gql',
  gqlPayloadLimit: '50mb',
} as const;
