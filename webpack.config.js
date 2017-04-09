const path = require('path');
const HTMLWebpackPlugin = require('html-webpack-plugin');


module.exports  = {
  context: __dirname +'/src'
  entry : {
    app: [
      './index.js'
    ]
  },
  output: {
    publicPath: '/',
    filename '[name].bundle.js',
    path: __dirname + '/public'
  },
  module: {
   rules: [
     {
       test: /\.(css|scss)$/,
       use: [
         'style-loader',
         'css-loader',
       ]
     },
     {
       test:    /\.html$/,
       exclude: /node_modules/,
       loader:  'file-loader?name=[name].[ext]',
     },
     {
       test:    /\.elm$/,
       exclude: [/elm-stuff/, /node_modules/],
       loader:  'elm-webpack-loader?verbose=true&warn=true',
     },
     {
       test: /\.woff(2)?(\?v=[0-9]\.[0-9]\.[0-9])?$/,
       loader: 'url-loader?limit=10000&mimetype=application/font-woff',
     },
     {
       test: /\.(ttf|eot|svg)(\?v=[0-9]\.[0-9]\.[0-9])?$/,
       loader: 'file-loader',
     },
   ],

   noParse: /\.elm$/,
 },
 plugins: [
   new HTMLWebpackPlugin({
            template: 'index-template.html'
          })
 ],
 devServer: {
   contentBase: './public',
   inline: true,
   hot: true
 },
 devtool: 'source-map'
}
