// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Interface definition
interface MyContractInterface {
    // Function to set a value
    function setValue(uint256 _value) external;

    // Function to get the stored value
    function getValue() external view returns (uint256);
}

// Contract implementing the interface
contract MyContractImplementation is MyContractInterface {
    uint256 private storedValue;

    // Implementing the setValue function from the interface
    function setValue(uint256 _value) external override {
        storedValue = _value;
    }

    // Implementing the getValue function from the interface
    function getValue() external view override returns (uint256) {
        return storedValue;
    }
}
