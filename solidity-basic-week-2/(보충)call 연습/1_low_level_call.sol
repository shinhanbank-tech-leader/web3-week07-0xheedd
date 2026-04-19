// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/* 
    (내용)
    : 수업 시 배웠던, abi.encodeWithSignature()를 활용한 call 예제코드입니다.

    (명칭)
    : 이러한 방식은 low-level call 이라고 합니다.
    : 아래와 같은 단점이 있기 때문입니다.

    (해당 방식의 단점)
    : 오타가 나도, 인자 타입이 틀려도 컴파일러는 잡아줄 수 없고
      배포하고 직접 실행해봐야 실수를 알 수 있습니다. 
*/

contract Caller {

    function callSetValue(address _storageAddress, uint256 _value) public returns (bool) {
        // TODO : 인자로 받은 storage 주소 값을 활용해서, Storage 컨트랙트의 setValue를 호출 -> 파라미터로 _value를 전달. 성공 여부를 변수 success에 할당
        (bool success, )  = _storageAddress.call(
            abi.encodeWithSignature("setValue(uint256)", _value)
        );
        /* -------------------------- */
        return success;
    }

}