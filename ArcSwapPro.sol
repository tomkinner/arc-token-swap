// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// ERC20 interface jate contract onno token-er sathe kotha bolte pare
interface IERC20 {
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function balanceOf(address account) external view returns (uint256);
}

contract ArcSwapPro {
    address public owner;
    uint256 public exchangeRate = 100; // 1 Token A = 100 Token B

    constructor() {
        owner = msg.sender;
    }

    // Sudhu owner exchange rate change korte parbe
    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    function setExchangeRate(uint256 _newRate) public onlyOwner {
        exchangeRate = _newRate;
    }

    // Actual Swap Function
    function swapTokens(address tokenIn, address tokenOut, uint256 amount) public {
        IERC20(tokenIn).transferFrom(msg.sender, address(this), amount);
        uint256 amountToReturn = amount * exchangeRate;
        IERC20(tokenOut).transfer(msg.sender, amountToReturn);
    }
}
