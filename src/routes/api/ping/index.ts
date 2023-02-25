import type { JsonObject } from "~/common/common";

export const onGet = ({ json }: JsonObject) => {
  json(200, { message: "Pong" });
};
