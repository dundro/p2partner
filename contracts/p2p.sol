pragma solidity ^ 0.4.18;

contract p2p {
    struct Vendor {
        uint id;
        address owner;
        uint agentShare;
        uint paymentCounter;
    }
    struct Agent {
        uint id;
        address owner;
    }
    struct Payment {
        uint amount;
        uint agentId;
        address agentAdress;
        uint vendorId;
        address client;
        bool agentWithraw;
        bool vendorWithdraw;
    }
    mapping (uint => Payment[]) public payments;
    event newAgent(uint id);
    event newVendor(uint id);
    event newPayment(uint amount, uint indexed agentId, uint indexed vendorId);
    Vendor[] public vendors;
    uint public vendorCounter;
    Agent[] public agents;
    uint public agentCounter;
    function pay(uint vendorId, uint agentId ) public payable
    {
        payments[vendorId].push(Payment(msg.value,agentId,agents[agentId].owner,vendorId,msg.sender,false,false));
        // ));
        require(msg.value>100);
        uint agentFee = vendors[vendorId].agentShare * msg.value/100;
        vendors[vendorId].paymentCounter += 1;
        agents[agentId].owner.transfer(agentFee);
        vendors[vendorId].owner.transfer(msg.value - agentFee);
        newPayment(msg.value, agentId,vendorId);
    }
    function createVendor(uint agentShare) public returns (uint){
        vendorCounter += 1;
        vendors.push(Vendor(vendorCounter,msg.sender,agentShare,0));
        newVendor(vendorCounter);
        return vendorCounter;
    }
    function registerAgent() public returns (uint) {
        agentCounter += 1;
        agents.push(Agent(agentCounter,msg.sender));
        newAgent(agentCounter);
        return agentCounter;
    }
    // function withdraw(uint vendorId) public
    // { 
    //     for (var index = 0; index < payments[vendorId].length; index++) {
    //         if (!payments[vendorId][index].agentWithraw && payments[vendorId][index].agentAdress == msg.sender)
    //         {

    //         }
    //     }
    // }

}