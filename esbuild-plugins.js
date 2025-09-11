const { nodeExternalsPlugin } = require('esbuild-node-externals')

module.exports = [
  nodeExternalsPlugin({
    dependencies: false,
    devDependencies: false,
    peerDependencies: false,
    optionalDependencies: false,
    allowList: ['@apollo/server', '@as-integrations/aws-lambda', 'graphql', 'dotenv']
  })
]