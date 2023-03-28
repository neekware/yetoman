import type { JsonObject } from "~/common/common";

export interface Hello {
  message: string;
}

export const onGet = ({ json }: JsonObject) => {
  json(200, { message: "World!" } as Hello);
};
