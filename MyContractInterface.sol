// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Interface definition
interface MyContractInterface {
    // Function to set a value
    function setValue(uint256 _value) external;

    // Function to get the stored value
    function getValue() external view returns (uint256);
}
