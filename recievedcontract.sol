// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./TargetContract.sol";

contract Encoder {
    function encodeWithSignature(uint256 amount, string memory message) public pure returns (bytes memory) {
        return abi.encodeWithSignature("receiveData(uint256,string)", amount, message);
    }

    function encodeWithSelector(uint256 amount, string memory message) public pure returns (bytes memory) {
        bytes4 selector = bytes4(keccak256("receiveData(uint256,string)"));
        return abi.encodeWithSelector(selector, amount, message);
    }

    function encode(uint256 amount, string memory message) public pure returns (bytes memory) {
        return abi.encode(amount, message);
    }

    function encodePacked(uint256 amount, string memory message) public pure returns (bytes memory) {
        return abi.encodePacked(amount, message);
    }

    function callReceiveData(address target, uint256 amount, string memory message) public payable  {
        TargetContract(target).receiveData(amount, message);
    }

    function callReceiveDataEncoded(address target, bytes memory data) public {
        (bool success, ) = target.call(data);
        require(success, "Call failed");
    }
}
