// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    //external함수 안에서 읽기만 할거라 calldata
    function sum(uint256[5] calldata arr) external pure returns (uint256) {
        uint256 tmpSum = 0;

        for(uint i = 0; i < 5; i++) {
            tmpSum += arr[i];
        }
        return tmpSum;
    }
}