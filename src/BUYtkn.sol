pragma solidity ^0.8.13;
// imports for erc20 standard can be added here
import "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";


contract BUY is ERC20 {
    /* Token name - BUY
    
    This contract is a simple implementation of an ERC20 token named "BUY" with the symbol "BUY" and 18 decimals.
    It includes basic functionalities such as transferring tokens, approving allowances, and checking balances.
    uint256 public totalSupply = 1000000 * (10 ** uint256(decimals));

    */

    
    constructor() ERC20("BUY", "BUY") {
        _mint(msg.sender, 1000000 * (10 ** uint256(decimals())));
    }
    

    
}