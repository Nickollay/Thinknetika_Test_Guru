process.env.NODE_ENV = process.env.NODE_ENV || 'development'

const environment = require('./environment')

module.exports = environment.toWebpackConfig()

const BundleAnalyzerPlugin =
    require('webpack-bundle-analyzer').BundleAnalyzerPlugin

environment.plugins.append(
    'BundleAnalyzerPlugin',
    new BundleAnalyzerPlugin()
)
