pragma solidity ^ 0.4.18;
import "./strings.sol";
library LeadUtils {
    using strings for *;
    function checkChallenge(string challenge) public pure returns(bool) {
        var s = challenge.toSlice();
        var delim = ".".toSlice();
        var parts = new string[](s.count(delim) + 1);
        for(uint i = 0; i < parts.length; i++) {
            parts[i] = s.split(delim).toString();
        }
        return (keccak256(parts[i]) == keccak256("dispute"));//TODO: add RSAchecksig   
    }
}