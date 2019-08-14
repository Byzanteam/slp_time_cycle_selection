const { environment } = require('@rails/webpacker')
const vue =  require('./loaders/vue')

environment.loaders.append('vue', vue)

const babelLoader = environment.loaders.get('babel')

// CS2 loader
environment.loaders.append('coffee', {
  test: /\.coffee$/,
  use:  babelLoader.use.concat(['coffee-loader'])
})

babelLoader.exclude = /node_modules/

let uglify_js_name = 'UglifyJs'

if (environment.plugins.getIndex(uglify_js_name) >= 0) {
  const UglifyJsPlugin = require('uglifyjs-webpack-plugin')

  environment.plugins.delete(uglify_js_name)

  environment.plugins.insert(
    uglify_js_name,
    new UglifyJsPlugin({
      parallel: true,
      cache: true,
      sourceMap: true,
      uglifyOptions: {
        ie8: false,
        ecma: 5,
        warnings: false,
        mangle: {
          safari10: true
        },
        compress: {
          warnings: false,
          comparisons: false
        },
        output: {
          ascii_only: true
        }
      }
    }),
    {
      before: 'Compression'
    }
  )
}

module.exports = environment
