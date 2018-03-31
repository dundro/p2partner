const p2p = artifacts.require('./p2p.sol')
module.exports = function (deployer, network, accounts) {
  deployer.deploy(p2p,{from:accounts[0]})
}
