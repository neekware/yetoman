/**
 * Decode HTML entities.
 *
 * @param html - HTML string to decode
 * @returns Decoded string
 */
export function decodeHTML(html: string): string {
  const entities: { [id: string]: string } = {
    amp: "&",
    apos: "'",
    gt: ">",
    lt: "<",
    nbsp: "\xa0",
    quot: '"',
  };
  return html.replace(/&([a-z]+);/gi, (match: string, entity: string) => {
    entity = entity.toLowerCase();
    if (Object.prototype.hasOwnProperty.call(entities, entity)) {
      return entities[entity];
    }
    return match;
  });
}

/**
 * Encode HTML entities.
 *
 * @param html - HTML string to encode
 * @returns Encoded string
 */
export function encodeHTML(html: string) {
  const entities: { [id: string]: string } = {
    "&": "&amp;",
    "'": "&apos;",
    ">": "&gt;",
    "<": "&lt;",
    "\xa0": "&nbsp;",
    '"': "&quot;",
  };
  return html.replace(/[&'"<> \xa0]/g, (match: string) => {
    return entities[match] || match;
  });
}

/**
 * Change the name of a function.
 *
 * @param fn - Function to change name
 * @param newName - New name
 * @returns Function with new name
 */

function changeFunctionName(fn: Function, newName: string): Function {
  const fnString = fn
    .toString()
    .replace(/function\s+([^\(]+)/, `function ${newName}`);
  return new Function(`return ${fnString}`)();
}

/**
 * Convert a function to a string, and adds execution option.
 *
 * @param fn - Function to convert to string
 * @param execute - Whether to execute the function
 * @returns String
 */
export const stringifyFunction = (fn: Function, execute = true): string => {
  let toStr = fn.toString();
  if (execute) {
    const functionName = fn.name;
    toStr = `${toStr}\n${functionName ? functionName + "();" : ""}`;
  }
  return `${toStr}\n`;
};

function functionToString(fn: Function): string {
  const fnStr = fn.toString();
  // For arrow functions, fn.toString() already returns the correct format
  if (fnStr.startsWith("function")) {
    // Extract the function parameters
    const params = fnStr
      .substring(fnStr.indexOf("(") + 1, fnStr.indexOf(")"))
      .replace(/\s+/g, "");

    // Extract the function body
    const body = fnStr.substring(
      fnStr.indexOf("{") + 1,
      fnStr.lastIndexOf("}")
    );

    // Construct the final string
    return `function ${fn.name}(${params}) {\n${body}\n}`;
  } else {
    return fnStr;
  }
}

/**
 * Combine a list of functions or strings into a single string, optionally
 * executing them in the order they are passed in.
 *
 * @param fns - List of functions or strings
 * @param execute - Whether to execute the functions
 * @returns String
 */
export function combineExecutables(
  fns: (string | Function)[],
  execute = true
): string {
  const reducer = (acc: string, fn: string | Function) => {
    if (typeof fn === "function") {
      return `${acc} ${stringifyFunction(fn, execute)} \n`;
    } else if (typeof fn === "string") {
      return `${acc} ${fn} \n`;
    }
    throw new Error("Invalid argument type for combineExecutables");
  };

  return fns.reduce(reducer, "");
}
