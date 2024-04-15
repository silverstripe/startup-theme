const mix = require('laravel-mix');
const fs = require('fs');
const globImporter = require('node-sass-glob-importer');
const { CleanWebpackPlugin } = require('clean-webpack-plugin');
const webpack = require("webpack");
const path = require('path');

// Set up project folders
const themeFolder = 'themes/startup';
const srcFolder = `src`;
const distFolder = `dist`;
const publicPath = `/_resources/${distFolder.substring(2)}/`;

const sassOptions = {
  sassOptions: {
    // Allow SCSS import wildcards
    importer: globImporter(),
    // Include cache-buster on urls
    processCssUrls: true,
  }
};

mix.webpackConfig({
  externals: {
    jquery: 'jQuery'
  }
});

mix
  .vue({ version: 3 })
  .extract(['vue'], `${distFolder}/vendor.js`)
  .js(`${srcFolder}/js/app.js`, '/')
  .sass(`${srcFolder}/scss/app.scss`, '/', sassOptions)
  .sass(`${srcFolder}/scss/editor.scss`, '/', sassOptions)
  .copyDirectory(`${srcFolder}/images`, `${distFolder}/images`);

mix.setPublicPath(`${distFolder}`);
mix.setResourceRoot(publicPath);

/**
 * Setup vue correctly
 */
mix.webpackConfig({
  plugins: [
    new webpack.DefinePlugin({
      __VUE_OPTIONS_API__: true,
      __VUE_PROD_DEVTOOLS__: false,
    }),
    new CleanWebpackPlugin({
      cleanOnceBeforeBuildPatterns: ['chunks/*'],
    }),
  ],
  output: {
    chunkFilename: 'chunks/[name]-[hash].js',
    publicPath: publicPath,
    path: path.join(process.cwd(), distFolder),
  },
});

/**
 * Development specific
 */
if (process.env.NODE_ENV === 'development') {
  // Add style lint
  // eslint-disable-next-line global-require
  const StyleLintPlugin = require('stylelint-webpack-plugin');
  mix.webpackConfig({
    plugins: [
      new StyleLintPlugin({
        context: srcFolder,
        files: ['**/*.{scss,vue}'],
      }),
    ],
  });

  // Add eslint
  // eslint-disable-next-line global-require
  const ESLintPlugin = require('eslint-webpack-plugin');
  mix.webpackConfig({
    plugins: [
      new ESLintPlugin({
        context: srcFolder,
        files: ['**/*.{js,vue}'],
      }),
    ],
  });

  // This allows you to proxy your site while watching, meaning when you change
  // your css/scss the file will get injected rather than requiring a reload
  if (process.env.MIX_BROWSERSYNC === 'true') {
    mix.browserSync({
      proxy: process.env.HOSTNAME,
      files: [`${distFolder}/**.*`],
    });
  }

  // Add sourcemaps in depending on the scenario you might want to
  // use these in prod too if the unminified code is fine to share
  // as it can make solving bugs easier
  mix.sourceMaps();
  mix.webpackConfig({ devtool: 'inline-source-map' });
}

/**
 * Windows specific config
 *
 * Depending on the version and setup of Windows, it will either not support symlinks entirely
 * or use a junction folder in place (a Windows feature comparible to Unix's symbolic links).
 *
 * The former results in need of copying data, the latter works out of the box.
 * We need to check the file type (directory, file, symlink, etc.) to know whether or not to copy.
 *
 * However, a junction presents itself to NodeJS as a standard directory, not as a symlink, and
 * and in turn causes "Error: Source and destination must not be the same." on attempted copy.
 * Luckily `realpath` returns as expected, so we can get around this by checking if source and
 * destination are the same.
 *
 * NOTE: This needs to be run after all other transpile actions.
 */
const publicResourcesFolder = `public/_resources/${distFolder}`;
if (
  process.platform === 'win32'
  && fs.realpathSync(distFolder) !== fs.realpathSync(publicResourcesFolder)
) {
  mix.copyDirectory(distFolder, publicResourcesFolder);
}
