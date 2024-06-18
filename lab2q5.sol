// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Importing the interface
import "./MyContractInterface.sol";

// Contract implementing the interface
contract MyContract is MyContractInterface {
    // Private variable to store the value
    uint256 private value;

    // Implementing the setValue function from the interface
    function setValue(uint256 _value) external override {
        value = _value;
    }

    // Implementing the getValue function from the interface
    function getValue() external view override returns (uint256) {
        return value;
    }
}
