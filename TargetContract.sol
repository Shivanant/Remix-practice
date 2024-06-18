// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TargetContract {
    event ReceivedData(address sender, uint256 amount, string message);

    function receiveData(uint256 amount, string memory message) public {
        emit ReceivedData(msg.sender, amount, message);
    }
}
