// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ContractA {
    uint public a;

    function set_Value(uint _a) external {
        a = _a;
    }
}

contract ContractB {
    function set_AValue(address _contractAAddress, uint _a) external {
        ContractA contractA = ContractA(_contractAAddress);
        contractA.set_Value(_a);
    }

    function get_AValue(address _contractAAddress) external view returns (uint) {
        ContractA contractA = ContractA(_contractAAddress);
        return contractA.a();
    }
}
