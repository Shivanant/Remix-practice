// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TxPropertiesExample {
    uint256 public gasPrice;
    address public txOrigin;

    // Function to demonstrate the usage of tx properties
    function performTransaction() external {
        // Accessing tx.gasprice
        gasPrice = tx.gasprice;

        // Accessing tx.origin
        txOrigin = tx.origin;

   
    }
}
