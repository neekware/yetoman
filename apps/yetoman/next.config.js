//@ts-check
const path = require('path');

// eslint-disable-next-line @typescript-eslint/no-var-requires
const { withNx } = require('@nrwl/next/plugins/with-nx');

// supported loaders
const supportedLoaders = ['next-babel-loader', 'next-swc-loader'];

// paths outside next we want to include and watch
const externalPaths = [path.join(__dirname, '../..', 'libs')];

/**
 * Checks if module rule has supported loader
 * @param rule module rule
 * @returns true if rule has a supported loader
 */
const hasNextSupportedLoader = (rule) => {
  if (Array.isArray(rule.use)) {
    return rule.use.find((l) => supportedLoaders.includes(l?.loader));
  }

  return supportedLoaders.includes(rule.use?.loader);
};

/**
 * Includes external module if they have supported loader
 * @param rule module rule
 */
const appendExternalPaths = (rule) => {
  const pattern = String(rule.test);

  if ((pattern && pattern.includes('tsx|ts')) || pattern.includes('ts|tsx')) {
    if (hasNextSupportedLoader(rule)) {
      rule.include = [...(rule?.include || []), ...externalPaths];
    }
  }
};

/**
 * @type {import('@nrwl/next/plugins/with-nx').WithNxOptions}
 **/
const nextConfig = {
  nx: {
    // Set this to true if you would like to to use SVGR
    // See: https://github.com/gregberge/svgr
    svgr: false,
  },
  reactStrictMode: true,
  webpack: (config) => {
    config.module.rules.forEach((rule) => {
      if (rule.test) {
        appendExternalPaths(rule);
      } else if (rule.oneOf) {
        rule.oneOf.forEach((rule) => {
          if (rule.test) {
            appendExternalPaths(rule);
          }
        });
      }
    });
    return config;
  },
};

module.exports = withNx(nextConfig);
