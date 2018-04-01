pragma solidity ^ 0.4.18;
import "./leadUtils.sol";
// import "./strings.sol";
// library leadUtils {
//     using strings for *;
//     function checkChallenge(string challenge) public pure returns(bool) {
//         var s = challenge.toSlice();
//         var delim = ".".toSlice();
//         var parts = new string[](s.count(delim) + 1);
//         for(uint i = 0; i < parts.length; i++) {
//             parts[i] = s.split(delim).toString();
//         }
//         return (keccak256(parts[i]) == keccak256("dispute"));//TODO: add RSAchecksig   
//     }
// }
contract Lead {
    // using leadUtils for *;
    string public data;
    uint public expiration;
    address public agent;
    address public seller;
    bool public isSettled;
    bool public isDisputed;
    uint public agentShare;
    function Lead(uint _agentShare, string _data, address _seller,uint _expiration) public{
        agent = msg.sender;
        agentShare = _agentShare;
        data = _data;
        seller = _seller;
        expiration = _expiration;
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
        if(leadUtils.checkChallenge(challenge)) isDisputed = true;
    }
} 
