var p2p = artifacts.require('./p2p.sol')
contract('p2p', ([Alice,Bob,Charlie])=> {
  beforeEach(async () => {
    instance = await p2p.new()
  })
  describe("createVendor", async() =>{
    it("should create new vendor Alice", async ()=> {
      await instance.createVendor(10,{from:Alice})
      assert.equal((await instance.vendors.call(0))[1],Alice);
    });
  })
  describe("registerAgent", async() =>{
    it("should create new agent Bob", async ()=> {
      await instance.registerAgent({from:Bob})
      assert.equal((await instance.agents.call(0))[1],Bob);
    });
  })
  describe("pay", async() =>{
    it("should pay 1 ether to contract from Charlie and distribute 0.1 to Alice and 0.9 to Charlie", async ()=> {
      console.log("Before:","Alice:" + web3.eth.getBalance(Alice),"Bob:" + web3.eth.getBalance(Bob),"Charlie:" + web3.eth.getBalance(Charlie));
      await instance.createVendor(10,{from:Alice})
      await instance.registerAgent({from:Bob})
      var tx = await instance.pay.sendTransaction(0,0,{from:Charlie,value:web3.toWei(1,'ether')});
      console.log("After:"," Alice:" + web3.eth.getBalance(Alice),"Bob:" + web3.eth.getBalance(Bob),"Charlie:" + web3.eth.getBalance(Charlie));
      // assert.equal((await instance.agents.call(0))[1],Bob);
    });
  })
});
