export interface AnyObject {
  [id: string]: any;
}

export type AnyFunction = (...args: any[]) => any;

export type AnyFunctionWithCallback = (...args: any[]) => any;

export type JsonObject = AnyObject;
