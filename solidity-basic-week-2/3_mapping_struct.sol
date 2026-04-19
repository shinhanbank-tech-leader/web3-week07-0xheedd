// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ProductRegistry {

    struct Product {
        string name;
        uint256 price;
        uint256 stock;
    }

    event ProductRegistered(uint256 productId, string name, uint256 price, uint256 stock);
    event StockReduced(uint256 productId, uint256 reducedAmount, uint256 remaining);

    /* -- 1. TODO : {id : product} 관리 map 선언 - 변수명 : products -- */
    mapping(uint256 => Product) public products;
    /* -------------------------- */
    uint256 public nextId = 1;
    uint256[] public productIds;     

    function  register(string memory _name, uint256 _price, uint256 _stock) public {
        /* -- 2. TODO :  map에 함수의 파라미터 값을 가진 Product 구조체를 등록 (key 값 = nextId) -- */
        products[nextId] = Product(_name, _price, _stock);
        /* -------------------------- */
        productIds.push(nextId);     
        
        emit ProductRegistered(nextId, _name, _price, _stock); // 이벤트 발행 - 상품 정보 추가함

        nextId++;
    }

    // 함수 - 상품 정보 조회
    function getProduct(uint256 _id) public view returns (string memory, uint256, uint256) {
        /* -- 3-1. TODO :  파라미터로 받은 특정 id의 상품 정보 읽어와서 변수 tmpProduct에 잠시 저장. -- */
        // 함수 내에서 임시로 사용하는 것이므로 memory에 올려두기
        Product memory tmpProduct = products[_id];
        /* -- 3-2. TODO :  그 후 이름, 가격, 재고 순으로 return -- */
        // return에 값이 여러개일 때는 괄호로 묶어 튜플 형태로 반환해야함
        return (tmpProduct.name, tmpProduct.price, tmpProduct.stock);
        /* -------------------------- */
    }

    // 함수 - 재고 조회
    function checkStock(uint256 _id) public view returns (bool) {
        /* -- 4. TODO :  파라미터로 받은 특정 id의 상품 정보를 읽어 재고 유무 판단 (stock이 1 이상인지 확인) -- */
        return products[_id].stock >= 1;
        /* -------------------------- */
    }

    // 함수 - 상품 출고 처리
    function reduceStock(uint256 _id, uint256 _amount) public {
        /* -- 5. TODO :  파라미터로 받은 특정 id의 상품 정보에 접근하여 재고(stock) 값을  amount개 만큼 줄이기 -- */
        products[_id].stock -= _amount;
        /* -------------------------- */
        
        emit StockReduced(_id, _amount, products[_id].stock); // 이벤트 발행
    }

}