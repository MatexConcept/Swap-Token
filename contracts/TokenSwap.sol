// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

import {IERC20} from "./IToken.sol";

contract SwapToken {
     IERC20 public tokenA; 
    IERC20 public tokenB; 

    
    uint256 public tokenASwapRate; 
    uint256 public tokenBSwapRate;

    
  constructor(
        address _tokenA,
        address _tokenB,
        uint256 _tokenASwapRate,
        uint256 _tokenBSwapRate
    ) {
        tokenA = IERC20(_tokenA);
        tokenB = IERC20(_tokenB);
        tokenASwapRate = _tokenASwapRate; 
        tokenBSwapRate = _tokenBSwapRate; 
    }


      function swapTokenAToTokenB(uint256 amountA) public {
      require(msg.sender != address(0), "Zero address not allowed");
        uint256 amountB = amountA * tokenASwapRate;

        
        require(tokenA.balanceOf(msg.sender) >= amountA, "Not enough Token B in contract");

       
        require(tokenA.transferFrom(msg.sender, address(this), amountA), "Token A transfer failed");

      
        require(tokenB.transfer(msg.sender, amountB), "Token B transfer failed");
    }

       function swapTokenBToTokenA(uint256 amountB) public {
    require(msg.sender != address(0), "Zero address not allowed");
        uint256 amountA = amountB / tokenBSwapRate;

       
        require(tokenB.balanceOf(msg.sender) >= amountB, "Not enough Token A in contract");

       
        require(tokenB.transferFrom(msg.sender, address(this), amountB), "Token B transfer failed");

        require(tokenA.transfer(msg.sender, amountA), "Token A transfer failed");
    }

   


 }




   


 

