// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Caller {
    uint256 public number;  

    function callDelegate(address _delegate, uint256 _number) public {
        bytes memory data = abi.encodeWithSignature("setNumber(uint256)", _number);

        (bool success, ) = _delegate.delegatecall(data);
        require(success, "Delegate call failed");
    }
}