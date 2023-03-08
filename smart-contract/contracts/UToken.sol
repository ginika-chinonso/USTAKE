// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract UToken is ERC20{

    address public owner;

    constructor(string calldata _name, string calldata _symbol, uint _amount) ERC20(_name, _symbol){
        owner = msg.sender;
        _mint(msg.sender, _amount);
    }

    function getToken(uint _amount) public {
        _mint(msg.sender, _amount);
    }
}
