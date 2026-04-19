// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/*
    (내용)
    : high-level call의 한 종류인 "인터페이스를 활용한 호출" 입니다.
    : 인터페이스를 정의해서 컴파일러에게 이런 함수가 있다고 정보를 알려주고, 그 인터페이스를 활용하여 호출하는 방식입니다.
    : 컴파일러에게 "이 주소에 있는 컨트랙트엔 이러한 양식의 함수가 있을거야~" 라고 알려주는 역할

    (문법-선언)
    : interface 인터페이스명 { 
        function 함수명(함수인자) external returns(반환타입);
        function 함수명(함수인자) external;
        ...
    }

    (문법-할당)
    : 컨트랙트 주소를 TODO 2와 같이 인터페이스 껍데기에 씌운 후 사용 가능

    (문법-호출)
    : 함수를 호출하듯, TODO 3와 같이 호출 가능
    
    (컴파일시)
    : 컴파일러는 선언된 인터페이스 정보를 기반으로, "오타나 인자 타입" 등을 체크해줌

    (유의사항)
    : 인터페이스는 '다른 컨트랙트에서 호출하기 위한' 것이므로 내부 함수에 external 키워드만 허용함
*/

// TODO 1 : Storage 컨트랙트에 맞춰 인터페이스 생성 ( 인터페이스명 : IStorage )
interface IStorage {
    function setValue(uint256 _value) external ; 
} 

contract Caller {

    function callSetValue(address _storageAddress, uint _value) public {
        // TODO 2 : 인자로 받은 storage 주소 값을 인터페이스 껍데기에 씌우고 변수에 할당하기 (변수명 : iStorage)
        IStorage iStorage = IStorage(_storageAddress);
        // TODO 3 : setValue 호출해서 _value를 인자로 전달하기 ( 리턴 값 없음 )
        iStorage.setValue(_value);
    }

}