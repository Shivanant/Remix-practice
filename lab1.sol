// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MainContract{
    uint public a=20;
    function Init_MainContract() public view returns(uint){
        return a;

    }
 }
contract Derived_contract is MainContract{
    function Init_DeriverdContract()public  view  returns (uint){
        return  Init_MainContract();
    }
}

contract AnotherContract{
    Derived_contract public obj;
    uint public b;
    function Init_AnotherContract()public returns (uint) {
        obj=new Derived_contract();
        b=obj.Init_DeriverdContract();
        return b;
    }
}