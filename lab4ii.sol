// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract AccessControl {
    address public owner;
    mapping(address => bool) public admins;
    mapping(address => bool) public users;
    uint public usercount;
    uint public admincount;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only contract owner can call this function.");
        _;
    }

    modifier onlyAdmin() {
        require(admins[msg.sender], "Only admins can call this function.");
        _;
    }

    modifier onlyUser() {
        require(users[msg.sender], "Only users can call this function.");
        _;
    }

    constructor() {
        owner = msg.sender;
        admins[msg.sender] = true;
    }

    function addAdmin(address _admin) public onlyOwner {
        admins[_admin] = true;
    }

    function removeAdmin(address _admin) public onlyOwner {
        require(_admin != owner, "Owner cannot be removed as admin.");
        admins[_admin] = false;
    }

    function addUser(address _user) public onlyAdmin {
        users[_user] = true;
    }

    function removeUser(address _user) public onlyAdmin {
        users[_user] = false;
    }

    function performAdminTask() public onlyAdmin {
        admincount++;
    }

    function performUserTask() public onlyUser {
        usercount++;
    }
}
