pragma solidity ^ 0.4.18;
import "./LeadUtils.sol";
contract Lead {
    using LeadUtils for *;
    string public data;
    uint expiration;
    address agent;
    address seller;
    bool isSettled;
    bool isDisputed;
    uint agentShare;
    function Lead(uint _agentShare, string _data, address _seller) public{
        agentShare = _agentShare;
        data = _data;
        seller = _seller;
    }
    function settle() public{
        isSettled = true;
        seller.transfer(address(this).balance * (1 - agentShare/100));
    }
    function agentWithdraw() public
    {
        require(isDisputed || isSettled);
        agent.transfer(address(this).balance);
    }
    function sellerWithDraw() public
    {
        require(!isDisputed && !isSettled && now > expiration);
        seller.transfer(address(this).balance);
    }
    function dispute(string challenge) public
    {
        if(LeadUtils.checkChallenge(challenge)) isDisputed = true;
    }
} 