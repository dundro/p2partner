pragma solidity ^ 0.4.18;

contract p2p {
    struct Vendor {
        uint id;
        address owner;
        uint agentShare;
    }
    struct Agent {
        uint id;
        address owner;
    }
    struct Payment {
        uint amount;
        uint agentId;
        uint vendorId;
        address client;
        // bool agentWithraw;
        // bool vendorWithdraw;
    }
    mapping (uint => Payment[]) public payments;
    Vendor[] public vendors;
    uint vendorCounter;
    Agent[] public agents;
    uint agentCounter;
    function pay(uint vendorId, uint agentId ) public payable
    {
        payments[vendorId].push(Payment(msg.value,agentId,vendorId,msg.sender));
        // ,false,false));
        require(msg.value>100);
        uint agentFee = vendors[vendorId].agentShare * msg.value/100;
        agents[agentId].owner.transfer(agentFee);
        vendors[vendorId].owner.transfer(msg.value - agentFee);
    }
    function createVendor(uint agentShare) public returns (uint){
        vendorCounter += 1;
        vendors.push(Vendor(vendorCounter,msg.sender,agentShare));
        return vendorCounter;
    }
    function registerAgent() public returns (uint) {
        agentCounter += 1;
        agents.push(Agent(agentCounter,msg.sender));
        return agentCounter;
    }
    // function withdraw(uint vendorId) public
    // {
    //     for (var index = 0; index < array.length; index++) {
            
    //     }
    // }

}