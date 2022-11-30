//@ts-check
const path = require('path');

// eslint-disable-next-line @typescript-eslint/no-var-requires
const { withNx } = require('@nrwl/next/plugins/with-nx');

const supportedLoaders = ['next-babel-loader', 'next-swc-loader'];
const hasNextSupportedLoader = (rule) => {
  if (Array.isArray(rule.use)) {
    return rule.use.find((l) => supportedLoaders.includes(l?.loader));
  }

  return supportedLoaders.includes(rule.use?.loader);
};

const appendExternalPaths = (rule, paths) => {
  const pattern = String(rule.test);

  if ((pattern && pattern.includes('tsx|ts')) || pattern.includes('ts|tsx')) {
    if (hasNextSupportedLoader(rule)) {
      rule.include = [...(rule?.include || []), ...paths];
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
    const libsPaths = [path.join(__dirname, '../..', 'libs')];
    config.module.rules.forEach((rule) => {
      if (rule.test) {
        appendExternalPaths(rule, libsPaths);
      } else if (rule.oneOf) {
        rule.oneOf.forEach((rule) => {
          if (rule.test) {
            appendExternalPaths(rule, libsPaths);
          }
        });
      }
    });
    return config;
  },
};

module.exports = withNx(nextConfig);
