// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Lab2 {
    address public contractAddress;
    address public senderAddress;
    uint256 public blockNumber;
    uint256 public timestamp;
    uint256 public msgValue;
    uint public diff;
    address payable  public coinbase;

    constructor() {
        // Example of accessing global variables
        contractAddress = address(this);
        senderAddress = msg.sender;
        blockNumber = block.number;
        timestamp = block.timestamp;
        diff=block.difficulty;
        coinbase=block.coinbase;

    }

    receive() external payable {
        msgValue = msg.value;
    }
}
