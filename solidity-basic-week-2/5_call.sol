// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ProductRegistry {

    struct Product {
        string name;
        uint256 price;
        uint256 stock;
    }

    mapping(uint256 => Product) public products;
    uint256[] public productIds;
    uint256 public nextId = 1;

    event ProductRegistered(uint256 productId, string name, uint256 price, uint256 stock);
    event StockReduced(uint256 productId, uint256 remaining);

    function register(string memory _name, uint256 _price, uint256 _stock) public {
        products[nextId] = Product(_name, _price, _stock);
        productIds.push(nextId);
        emit ProductRegistered(nextId, _name, _price, _stock);
        nextId++;
    }

    function getProduct(uint256 _id) public view returns (string memory, uint256, uint256) {
        Product memory p = products[_id];
        return (p.name, p.price, p.stock);
    }

    // (함수) 재고 조회
    function checkStock(uint256 _id, uint256 _amount) public view returns (bool) {
        return products[_id].stock >= _amount;
    }

    function reduceStock(uint256 _id, uint256 _amount) public {
        products[_id].stock -= _amount;
        emit StockReduced(_id, products[_id].stock);
    }
}

contract OrderFactory {

    Order[] public orders;
    address public registryAddress; // ProductRegistry 컨트랙트 주소를 저장할 변수

    constructor(address _registryAddress) {
        registryAddress = _registryAddress; // OrderFactory 생성시 productRegistry 주소를 받아서 저장
    }

    // 주문하기
    function createOrder(uint256 _productId, uint256 _amount) public {
        Order order = new Order(registryAddress, _productId, _amount); // Order 생성
        orders.push(order);
    }
}


contract Order {
    
    uint256 public productId;
    uint256 public amount;
    bool public completed;

    // 이벤트 선언
    event OrderCompleted(uint256 productId);
    event OrderFailed(uint256 productId);

    constructor (address _registryAddress, uint256 _productId, uint256 _amount) {
        productId = _productId;
        amount = _amount;

        /* 1-1. TODO : 파라미터로 전달받은 ProductRegistry 주소로 checkStock() 함수 사용 요청을 보내 상품 재고 유무 파악하기 */
        (bool success, bytes memory data) = _registryAddress.call(  // data: checkStock 함수 리턴값
            abi.encodeWithSignature("checkStock(uint256,uint256)", productId, amount)
        );
        /* -------------------------- */

        require(success, "checkStock call failed"); // 함수 호출 성공 여부 판단 로직
        
        /* 1-2. TODO : 함수 호출의 결과를 bool 값으로 디코딩하여 completed 변수에 할당 */
        completed = abi.decode(data, (bool));
        /* -------------------------- */

        if (completed) {
            /* 2. TODO : ProductRegistry 컨트랙트의 reduceStock() 함수를 사용해, 파라미터로 전달받은 id의 상품을 amount 개 만큼 출고. 리턴값 없음 */
            (bool success2, ) = _registryAddress.call(
                abi.encodeWithSignature("reduceStock(uint256,uint256)", productId, amount)
            );
            /* -------------------------- */

            require(success2, "reduceStock call failed"); // 함수 호출 성공 여부 판단 로직

            emit OrderCompleted(_productId);
        } else {
            emit OrderFailed(_productId);
        }
    }

}

