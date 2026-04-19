// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ProductRegistry {

    event ProductRegistered(uint256 productId); // 등록 모니터링용! 로그 찍기 위한 이벤트 선언

    uint256 public nextId = 1; // 변수 : id 초기값

    /* -- 1. TODO : id 목록 배열 선언 (uint256 배열, 변수명은 productIds) -- */
    uint256[] public productIds;
    /* -------------------------- */

    // 함수1 - 신규 상품 추가
    function  register() public {
        /* -- 2. TODO  : id 목록에 신규 id (=nextId) 추가 -- */
        // push메서드로 배열에 값 추가
        productIds.push(nextId);
        /* -------------------------- */

        emit ProductRegistered(nextId); //  이벤트 발생(로깅용)
        nextId++; // Id 값 증가
    }

    // 함수2 - 관리하는 id의 개수를 조회
    function getLength() public view returns(uint256) {
        /* -- 3. TODO : id 목록 길이 반환 -- */
        return productIds.length;
        /* -------------------------- */
    }

    // (참고) 배열 전체 상태 확인 위한 임시 함수 
    function getAllIds() public view returns (uint256[] memory) {
        return productIds;
    }
}

