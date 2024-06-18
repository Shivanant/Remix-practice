// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VoterList {
    address public manager;
    mapping(address => bool) public voters;

    modifier onlyManager() {
        require(msg.sender == manager, "Only manager can call this function");
        _;
    }

    constructor() {
        manager = msg.sender;
    }

    function addVoter(address _voter) public onlyManager {
        voters[_voter] = true;
    }
}
