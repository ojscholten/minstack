pragma solidity ^0.7.0;

// UNTESTED MINSTACK CONTRACT V1 - DO NOT DEPLOY

contract MinStack{

	// define a mapping (like a dict) which holds who has deposited what (to be used for withdrawals)
	mapping (address =>uint) public heldFunds;
	
	// deposits the transactions value to this contract
	function deposit() public payable{
	    
	    uint amount = msg.value; // get the value of the tranasction to this contract
	    
	    heldFunds[msg.sender] += amount;
	    
	}
	
	function withdraw(address payable user) public{
	    
	    // first make sure that the recipient of funds from this function is the one who called it
	    require(msg.sender == user, 'cannot withdraw someone elses funds');
	    
	    user.transfer(heldFunds[msg.sender]);
	    
	}

}