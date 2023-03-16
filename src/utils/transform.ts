export function htmlDecode(html: string) {
  return html.replace(/&([a-z]+);/gi, (match: string, entity: string) => {
    const entities: { [id: string]: string } = {
      amp: "&",
      apos: "'",
      gt: ">",
      lt: "<",
      nbsp: "\xa0",
      quot: '"',
    };
    entity = entity.toLowerCase();
    if (Object.prototype.hasOwnProperty.call(entities, entity)) {
      return entities[entity];
    }
    return match;
  });
}

export const stringifyFunction = (fn: Function, execute = true) => {
  let toStr = fn.toString();
  if (execute) {
    toStr = `${toStr}\n${fn.name}();`;
  }
  return toStr;
};

export function combineExecutables(
  fns: (string | Function)[],
  execute = true
): string {
  const reducer = (acc: string, fn: string | Function) => {
    if (typeof fn === "function") {
      return acc + stringifyFunction(fn, execute) + "\n";
    } else if (typeof fn === "string") {
      return acc + fn + "\n";
    }
    return acc;
  };

  return fns.reduce(reducer, "");
}
