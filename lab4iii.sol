// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract ModifierWithArguments {
    uint private storedValue=100;

    modifier checkValue(uint _expectedValue) {
        require(_expectedValue == storedValue, "Value does not match expected value.");
        _;
    }

    function setValue(uint _newValue) public checkValue(_newValue) {
        storedValue = _newValue;
    }

    function getStoredValue() public view returns (uint) {
        return storedValue;
    }
}
