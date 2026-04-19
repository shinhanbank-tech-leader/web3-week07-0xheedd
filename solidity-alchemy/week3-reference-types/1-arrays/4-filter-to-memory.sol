// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    function filterEven (uint[] calldata arr) external pure returns (uint[] memory) {
        uint elements;
		for(uint i = 0; i < arr.length; i++) {
			if(arr[i]%2 == 0) {
                elements++;
            }
		}
        
        uint[] memory filtered = new uint[](elements);
        uint filledIndex = 0;
        
        for (uint i=0; i<arr.length; i++){
            if(arr[i]%2 == 0) {
                filtered[filledIndex] = arr[i];
                filledIndex++;
            }
        }
        return filtered;
    }
}