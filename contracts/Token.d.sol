// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract  TokenD is ERC20("TOKEND", "TKD") {
    address owner;

    constructor(uint _amount) {
        owner = msg.sender;
        uint256 amount = _amount ** 18;
        _mint(msg.sender, amount);
    }

    function mintToken(uint32 _amount) external {
        require(msg.sender == owner, "You're not the owner");
        _mint(msg.sender, _amount ** 18);
    }
}

