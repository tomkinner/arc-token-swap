// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TokenSwap {
    uint256 public exchangeRate = 100;

    function getConvertedAmount(uint256 _amount) public view returns (uint256) {
        return _amount * exchangeRate;
    }
}
