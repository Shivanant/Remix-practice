// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ContractA {
    uint public a;

    function set_Value(uint _a) external {
        a = _a;
    }
}

contract ContractB {
    ContractA public contractA;

    constructor(ContractA _contractAInstance) {
        contractA = _contractAInstance;
    }

    function set_AValue(uint _a) external {
        contractA.set_Value(_a);
    }

    function get_AValue() external view returns (uint) {
        return contractA.a();
    }
}
