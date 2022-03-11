const path = require('path')
const { VueLoaderPlugin } = require('vue-loader')
const { EnvironmentPlugin } = require('webpack')
const HtmlWebpackPlugin = require('html-webpack-plugin')
const { CleanWebpackPlugin } = require('clean-webpack-plugin');
const CopyWebpackPlugin = require("copy-webpack-plugin");

const THEME_NAME = 'openfinance'
const entries = ['login', 'register', 'login-reset-password']

module.exports = (env, argv) => {
  const isDevelopment = argv.mode !== 'production' ? true : false
  return {
    entry: () => {
      let entryList = {}
      for(let entry of entries) {
        entryList[entry] = path.resolve(__dirname, 'src', 'views', entry, 'index.ts')
      }
      return entryList
    },
    output: {
      path: path.resolve(__dirname, '..', 'themes', THEME_NAME, 'login'),
      filename: 'resources/js/[name].js',
      publicPath: '/'
    },
    devtool: 'inline-cheap-module-source-map',
    resolve: {
      extensions: ['.ts', '.tsx', '.js', '.vue', '.json', '.scss'],
      alias: {
        '~': path.resolve(__dirname, 'src')
      }
    },
    mode: isDevelopment ? 'development' : 'production',
    watch: isDevelopment ? true : false,
    module: {
      rules: [
        {
          test: /\.vue$/,
          loader: 'vue-loader',
          options: {
            sourceMap: isDevelopment,
            extract: false
          }
        },
        {
          test: /\.(ts|tsx)$/,
          exclude: /node_modules/,
          use: {
            loader: 'babel-loader',
            options: {
              presets: ['@babel/preset-env', '@babel/preset-typescript'],
              plugins: [
                '@babel/plugin-transform-runtime',
                '@babel/plugin-transform-typescript'
              ]
            }
          }
        },
        {
          test: /\.(scss|css)$/,
          use: [
            'style-loader',
            'css-loader',
            {
              loader: 'postcss-loader',
              options: {
                postcssOptions: {
                  plugins: { autoprefixer: {} }
                }
              }
            },
            'sass-loader'
          ]
        }
      ]
    },
    plugins: [
      new CleanWebpackPlugin(),
      new VueLoaderPlugin(),
      ...entries.map(entry => new HtmlWebpackPlugin({
        inject: false,
        template: path.resolve(__dirname, 'src', 'views', entry, 'index.ftl'),
        filename: `${entry}.ftl`,
        minify: false
      })),
      new CopyWebpackPlugin({
        patterns: [
          { 
            from: path.resolve(__dirname, 'src', 'static'),
            to: path.resolve(__dirname, '..', 'themes', THEME_NAME, 'login')
          }
        ]
      })
    ],
    ...(isDevelopment
    ? {} 
    : {
        optimization: {
        removeAvailableModules: false,
        removeEmptyChunks: false,
        splitChunks: false
      }
    })
  }
}
