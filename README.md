# p2partner
```var address = "0x439e9d186970e47c7f9cdf34f24d757b3de5ee9b"
var abi  = [
	{
		"constant": true,
		"inputs": [
			{
				"name": "",
				"type": "uint256"
			},
			{
				"name": "",
				"type": "uint256"
			}
		],
		"name": "payments",
		"outputs": [
			{
				"name": "amount",
				"type": "uint256"
			},
			{
				"name": "agentId",
				"type": "uint256"
			},
			{
				"name": "agentAdress",
				"type": "address"
			},
			{
				"name": "vendorId",
				"type": "uint256"
			},
			{
				"name": "client",
				"type": "address"
			},
			{
				"name": "agentWithraw",
				"type": "bool"
			},
			{
				"name": "vendorWithdraw",
				"type": "bool"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [],
		"name": "registerAgent",
		"outputs": [
			{
				"name": "",
				"type": "uint256"
			}
		],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [
			{
				"name": "",
				"type": "uint256"
			}
		],
		"name": "agents",
		"outputs": [
			{
				"name": "id",
				"type": "uint256"
			},
			{
				"name": "owner",
				"type": "address"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [
			{
				"name": "",
				"type": "uint256"
			}
		],
		"name": "vendors",
		"outputs": [
			{
				"name": "id",
				"type": "uint256"
			},
			{
				"name": "owner",
				"type": "address"
			},
			{
				"name": "agentShare",
				"type": "uint256"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "vendorId",
				"type": "uint256"
			},
			{
				"name": "agentId",
				"type": "uint256"
			}
		],
		"name": "pay",
		"outputs": [],
		"payable": true,
		"stateMutability": "payable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "agentShare",
				"type": "uint256"
			}
		],
		"name": "createVendor",
		"outputs": [
			{
				"name": "",
				"type": "uint256"
			}
		],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	}
]
var contract = web3.eth.contract(abi)
var instance = contract.at(address)
instance.createVendor(10,(error,result) => {console.log(result)}) //создать "сервис" с адресом вызывающего. 10 - это 10 %
instance.registerAgent()// создает агента с адресом вызывающего
instance.pay.sendTransaction(0,0,{value:web3.toWei(0.01,'ether')},(error,result)=>{console.log(result)})
//оплата от клиента
```