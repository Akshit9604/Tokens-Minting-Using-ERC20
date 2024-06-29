// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/token/ERC20/ERC20.sol";

contract CustomToken is ERC20 {
    address public tokenOwner;

    modifier onlyOwner() {
        require(msg.sender == tokenOwner, "Only owner will be able to call this function");
        _;
    }

    constructor(uint256 initialSupply) ERC20("Custom Token", "CTK") {
        tokenOwner = msg.sender;
        _mint(tokenOwner, initialSupply * 10 ** uint256(decimals()));
    }

    function mintTokens(address to, uint256 amount) public onlyOwner {
        _mint(to, amount * 10 ** uint256(decimals()));
    }

    function burnTokens(uint256 amount) public {
        _burn(msg.sender, amount * 10 ** uint256(decimals()));
    }

    function transferTokens(address to, uint256 amount) public returns (bool) {
        return transfer(to, amount * 10 ** uint256(decimals()));
    }
}

