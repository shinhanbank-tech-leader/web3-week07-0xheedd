// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Order {
    
    uint256 public productId;
    uint256 public amount;
    bool public completed; // 주문 성공 여부

    /* -- 1. TODO : 상품 Id, 상품 수량 받아서 세팅하는 Order 생성자 구현 ( completed 초기값 = false) -- */
    constructor(uint256 _productId, uint256 _amount) {
        productId = _productId;
        amount = _amount;
        completed = false;
    }
    /* -------------------------- */

}

contract OrderFactory {
    
    Order[] public orders; // Order 담을 배열 선언

    event OrderCreated(address orderAddress, uint256 productId, uint256 amount, bool completed); // 이벤트 선언

    // 함수 - 주문 생성
    function createOrder(uint256 _productId, uint256 _amount) public {
        /* -- 2. TODO : 함수 인자값을 활용하여 Order instance 생성 -- */
        Order order = new Order(_productId, _amount);
        /* -------------------------- */
        
        orders.push(order); // 목록에 넣기
        
        /* -- 3. TODO : 만들어진 Order의 정보로 이벤트(OrderCreated) 발행하기 (주소, 구매물품id, 구매수량, 주문성공여부) -- */
        emit OrderCreated(address(order), order.productId(), order.amount(), order.completed()); // getter로 접근해야하니까 ()
        /* -------------------------- */        
    }
}