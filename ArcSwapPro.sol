// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IERC20 {
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function balanceOf(address account) external view returns (uint256);
}

contract ArcSwapPro {
    address public owner;
    uint256 public exchangeRate = 100;

    // 1. Event define kora
    event TokensSwapped(
        address indexed user,
        address tokenIn,
        address tokenOut,
        uint256 amountIn,
        uint256 amountOut
    );

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    function setExchangeRate(uint256 _newRate) public onlyOwner {
        exchangeRate = _newRate;
    }

    function swapTokens(address tokenIn, address tokenOut, uint256 amount) public {
        require(IERC20(tokenIn).balanceOf(msg.sender) >= amount, "Insufficient balance");
        
        IERC20(tokenIn).transferFrom(msg.sender, address(this), amount);
        uint256 amountToReturn = amount * exchangeRate;
        
        // Contract-e jotheshto token ache ki na check kora
        require(IERC20(tokenOut).balanceOf(address(this)) >= amountToReturn, "Contract has no liquidity");
        
        IERC20(tokenOut).transfer(msg.sender, amountToReturn);

        // 2. Event trigger kora
        emit TokensSwapped(msg.sender, tokenIn, tokenOut, amount, amountToReturn);
    }
}
