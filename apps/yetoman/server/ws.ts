import { PubSub } from "graphql-subscriptions";
import WebSocket from "ws";

export type WebSocketServer = WebSocket.Server<WebSocket.WebSocket>;

// Create a common subscription object
const commonPubSub = new PubSub();

/**
 * Create a WebSocket Server
 * @param options WebSocket ServerOptions
 * @returns a WebSocket.Server object
 */
export function createWebSocket(
  options: WebSocket.ServerOptions
): WebSocket.Server<WebSocket.WebSocket> {
  const server = new WebSocket.WebSocketServer(options);
  return server;
}

/**
 * Create a new or a global pubsub object
 * @param global boolean, if true, a global shared object is returned
 * @returns a PubSub object
 */
export function getPubSub(global = true): PubSub {
  return global ? commonPubSub : new PubSub();
}
