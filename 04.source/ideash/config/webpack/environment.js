const {environment} = require('@rails/webpacker')
const erb = require('./loaders/erb')

const webpack = require('webpack')
environment.plugins.prepend('Provide',
    new webpack.ProvidePlugin({
        $: 'jquery',
        jQuery: 'jquery',
    })
)

const aliasConfig = {
    'jquery': 'jquery/src/jquery',
    'jquery-ui': 'jquery-ui'
};

environment.config.set('resolve.alias', aliasConfig);

environment.loaders.prepend('erb', erb)
module.exports = environment