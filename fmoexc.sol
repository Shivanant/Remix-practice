// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract TokenSale {
    
    IERC20 public token;
    uint256 public rate;
    address owner;

    event TokensPurchased(address indexed purchaser, uint256 value, uint256 amount);

    constructor(uint256 _rate, address _tokenAddress) {
        require(_rate > 0, "Rate must be greater than 0");
        require(_tokenAddress != address(0), "Token address cannot be 0x0");

        rate = _rate;
        token = IERC20(_tokenAddress);
        owner=msg.sender;
    }

    receive() external payable {
        buyTokens();
    }

    modifier onlyOwner{
        require(msg.sender==owner,"Not the owner");
        _;
    }

    function buyTokens() public payable {
        uint256 tokenAmount = getTokenAmount(msg.value);
        require(token.balanceOf(address(this)) >= tokenAmount, "Insufficient tokens in contract");

        token.transfer(msg.sender, tokenAmount);
        emit TokensPurchased(msg.sender, msg.value, tokenAmount);
    }

    function getTokenAmount(uint256 weiAmount) public view returns (uint256) {
        return weiAmount * rate;
    }

    function withdrawETH() external onlyOwner {
        payable(owner).transfer(address(this).balance);
    }

    function withdrawTokens() external onlyOwner {
        uint256 tokenBalance = token.balanceOf(address(this));
        token.transfer(owner, tokenBalance);
    }
}
