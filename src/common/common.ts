// disable eslint for no explicit any for the next line
/* eslint-disable-next-line @typescript-eslint/no-explicit-any */
export type Anything = any;

export interface AnyObject {
  [id: string]: Anything;
}

export type AnyFunction = (...args: Anything[]) => Anything;

export type AnyFunctionWithCallback = (...args: Anything[]) => Anything;

export type JsonObject = AnyObject;
