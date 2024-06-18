//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.19;

contract Encoding{
    function encodingnumber()public pure returns(bytes memory){
        bytes memory number=abi.encode("some String");
        return number;
    }
    function encodingPacked() public  pure returns(bytes memory){
        bytes memory someString=abi.encodePacked("some String");
        return someString;
    }
    function decode() public pure returns (string memory){
        string memory str=abi.decode(encodingnumber(), (string));
        return  str;

    }


    //call function changes thw state of block chain;
    function multiencode()public pure returns(bytes memory){
        bytes memory str= abi.encode('shiva','vuiyvu');
        return str;
    }
    function multidecode()public  pure returns(string memory,string memory){
        (string memory s1,string memory s2)=abi.decode(multiencode(),(string,string));
        return (s1,s2) ;
    }

    function multipackedencode()public pure returns(bytes memory){
        bytes memory str= abi.encodePacked('shiva','vuiyvu');
        return str;
    }

    //this will fail
    function multipackeddec() public pure returns (string memory,string memory){
        (string memory s1,string memory s2)=abi.decode(multipackedencode(),(string,string));
        return (s1,s2);

    }
    function castmultidec() public  pure returns (string memory){
        string memory str= string(multipackedencode());
        return str;
    }
    function withdraw (address recentwinner)public {
        (bool s,)=recentwinner.call{value:address(this).balance}("");
        require(s,"Transfer Failed ");
    }
}