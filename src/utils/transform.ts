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

export const stringifyFunction = (fn: Function, execute = false) => {
  let toStr = fn.toString();
  if (execute) {
    toStr = `${toStr} ${fn.name}();`;
  }
  return toStr;
};
