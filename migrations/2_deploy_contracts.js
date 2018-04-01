const p2p = artifacts.require('./p2p.sol')
const leadUtils = artifacts.require('./leadUtils.sol')
const lead = artifacts.require('./lead.sol')
const affiliateV2 = artifacts.require('./affiliateV2.sol')
module.exports = async (deployer, network, accounts) =>{
  await deployer.deploy(leadUtils,{from:accounts[0]})
  await deployer.link(leadUtils,lead)
  await deployer.deploy(lead,{from:accounts[0]})
  await deployer.link(leadUtils,affiliateV2)
  await deployer.link(lead,affiliateV2)
  await deployer.deploy(affiliateV2)
  
}
