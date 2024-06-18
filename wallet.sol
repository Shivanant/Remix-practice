// // SPDX-License-Identifier: MIT
// pragma solidity ^0.8.19;

// contract Wallet {
//     // address payable public add1;
//     // address payable public add2;
//     address payable public owner;
//     constructor() {
//         owner= payable(msg.sender);
        
//     }

//     function transferfunds(address payable add2)public payable{
//         // require(add1!=add2,"Same address funds transfer");
//         require(msg.value > 0, "No Ether sent");
//         add2.transfer(msg.value);

//     }
// }