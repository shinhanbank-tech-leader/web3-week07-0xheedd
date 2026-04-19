// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ProductRegistry {

    /* -- 1. TODO : Product 구조체 선언 - 이름(name), 가격(price), 재고(stock)의 속성을 가짐 -- */
    struct Product {
        string name;
        uint256 price;
        uint256 stock;
    }
    /* -------------------------- */

    event ProductRegistered(uint256 productId);

    uint256 public nextId = 1;
    uint256[] public productIds;     

    function  register() public {
        productIds.push(nextId);     
        emit ProductRegistered(nextId);
        nextId++;
    }

    function getLength() public view returns(uint256) {
        return productIds.length;   
    }

    function removeLast() public {
        productIds.pop();           
    }

    function getAllIds() public view returns (uint256[] memory) {
        return productIds;
    }
}

