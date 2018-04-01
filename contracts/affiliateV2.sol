pragma solidity ^ 0.4.18;
import "./lead.sol";
contract affiliateV2 {
  Lead[] public leads;
  function createContract(uint agentShare, string hashedData, address seller) public {
    leads.push(new Lead(agentShare, hashedData,seller, now + 86400));
    }
}

//10,"9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08", "0xf17f52151ebef6c7334fad080c5704d77216b732"