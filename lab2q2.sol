// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MsgPropertiesExample {
    address public sender;
    bytes4 public sig;
    uint256 public value;

    // Function to demonstrate the usage of msg properties
    function sendMessage() external payable {
        // Accessing msg.sender
        sender = msg.sender;


        // Accessing msg.sig
        sig = msg.sig;

        // Accessing msg.value
        value = msg.value;

        // Perform some action based on the received message
        // ...
    }
}
