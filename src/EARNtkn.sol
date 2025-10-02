pragma solidity ^0.8.13;
import "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract EARN is ERC20 {
    constructor() ERC20("EARN", "EARN"){
        _mint(msg.sender, 10000000 * (10 ** uint256(decimals())));
    }
    
}