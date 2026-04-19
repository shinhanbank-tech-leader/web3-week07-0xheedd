// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    function sum(uint256[] calldata arr) external pure returns (uint256) {
        uint256 tmpSum = 0;

        for(uint i = 0; i < arr.length; i++){
            tmpSum += arr[i];
        }
        return tmpSum;
    }
}