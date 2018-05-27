// Given an address hash, detect whether it's a contract-type address or a normal one
/***
 *   This contract IS WORKING now with latest solidity compiler 0.4.24. - Anurag 27-May-2018                                              
 */

pragma solidity ^0.4.0;

contract ContractDetector {

    address creator;
    string public contract_or_normal = "not checked";
    
    constructor () public {
        creator = msg.sender;
    }
    
    function testContractOrNormal(address inc_addr) public {
    	if(inc_addr.call())
    		contract_or_normal = "normal";
    	else
    		contract_or_normal = "contract";
    }
    
    function getContractOrNormal() public view returns (string) {
    	return contract_or_normal;
    }
    
    /**********
     Standard kill() function to recover funds 
     **********/
    
    function kill() public { 
        if (msg.sender == creator)
        {
            selfdestruct(creator);  // kills this contract and sends remaining funds back to creator
        }
    }
}
