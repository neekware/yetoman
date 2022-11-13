/**
 * @license
 * Copyright Neekware Inc. All Rights Reserved.
 *
 * Use of this source code is governed by a proprietary notice
 * that can be found at http://neekware.com/license/PRI.html
 */

import { exec } from "child_process";
import { existsSync } from "fs";
import { glob } from "glob";
import { join, resolve } from "path";

require('dotenv').config();

export const projName = 'FullestStack';
export const projDir = resolve(__dirname, '../..');
export const coverageDir = resolve(join(projDir, 'coverage'));
export const libDir = resolve(join(projDir, 'libs'));
export const appsDir = resolve(join(projDir, 'apps'));
export const distDir = resolve(join(projDir, 'dist'));
export const projPkgJson = require(join(projDir, 'package.json'));

export const sleep = (ms: number) =>
  new Promise((resolve) => setTimeout(resolve, ms));

/**
 * Runs a command, capture and return the output
 * @param script {string} an executable command
 */
export function execute(script: string, debug = false): Promise<any> {
  return new Promise((resolvePromise, rejectPromise) => {
    exec(script, { maxBuffer: 1024 * 1000 }, (error, stdout, stderr) => {
      if (error) {
        console.error(error);
        rejectPromise(stderr);
      } else {
        resolvePromise(stdout);
      }
    });
  });
}

/**
 * Checks if a file exists
 * @param filePath path to file
 */
export function fileExists(filePath: string): boolean {
  try {
    return existsSync(filePath);
  } catch (err) {
    return false;
  }
}

/**
 * Returns a list of file name
 * @param globPattern pattern for globs
 */
export function getGlobFiles(globPattern: string): Promise<string[]> {
  // /**/error.log, /**/results.txt, ...etc
  return new Promise((resolve, reject) => {
    glob(globPattern, (error, result) => {
      if (error) {
        console.log(error);
        resolve([]);
      }
      resolve(result);
    });
  });
}
