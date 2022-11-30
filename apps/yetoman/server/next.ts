import next from "next";
import {
  createProjectGraphAsync,
  readProjectsConfigurationFromProjectGraph
} from "nx/src/project-graph/project-graph";
import { workspaceRoot } from "nx/src/utils/workspace-root";
import { join as pathJoin } from "path";

import {
  ExecutorContext,
  parseTargetString,
  ProjectConfiguration,
  readJsonFile,
  readTargetOptions,
  workspaceLayout
} from "@nrwl/devkit";
import { NextBuildBuilderOptions, NextServerOptions } from "@nrwl/next";
import { prepareConfig } from "@nrwl/next/src/utils/config";
import {
  PHASE_DEVELOPMENT_SERVER,
  PHASE_PRODUCTION_SERVER
} from "@nrwl/next/src/utils/constants";

/**
 * Create a next app
 * @param dev if development or production build
 * @param dir app directory
 * @param port server port
 * @returns next app
 */
export async function createNextApp(options: Partial<NextServerOptions>) {
  // app's project configuration
  const projectConfig = readJsonFile<ProjectConfiguration>(`${options.dir}/project.json`);
  const projectGraph = await createProjectGraphAsync();
  const workspaceConfig = readProjectsConfigurationFromProjectGraph(projectGraph);

  // context
  const context: ExecutorContext = {
    root: workspaceRoot,
    cwd: process.cwd(),
    workspace: workspaceConfig,
    isVerbose: false,
    projectGraph,
  };

  // build options
  const buildOptions = readTargetOptions<NextBuildBuilderOptions>(
    parseTargetString(projectConfig.targets?.['serve']?.options?.['buildTarget'] ?? ''),
    context
  );

  // next configuration
  const conf = await prepareConfig(
    options.dir ? PHASE_DEVELOPMENT_SERVER : PHASE_PRODUCTION_SERVER,
    buildOptions,
    context,
    [],
    pathJoin(context.root, workspaceLayout().libsDir)
  );

  // next app
  return next({ options, ...conf });
}
