pragma solidity ^ 0.4.18;
import "./lead.sol";
contract affiliateV2 {
  Lead[] leads;
  function createContract(uint agentShare, string hashedData) public {
    leads.push(new Lead(agentShare, hashedData));
    }
}