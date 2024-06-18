// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OwnerInfo {
    // Address of the contract owner
    address public owner;
    // Constructor to set the contract's deployer as the owner
    constructor() {
        owner = msg.sender;
    }
    // Function to get the owner

    function getBalance() public view returns (uint) {
        return msg.sender.balance;
    }
    // Function to receive Ether, making the contract able to hold ETH
    receive() external payable {}
}
