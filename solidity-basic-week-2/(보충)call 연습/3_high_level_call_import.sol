// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/*
    (내용)
    : high-level call의 다른 한 종류
    : 부르고 싶은 컨트랙트의 .sol 소스코드가 있다면 굳이 인터페이스를 만들지 않아도 호출이 가능함.
    : 컴파일러가 소스코드를 직접 보고 판단하면 되기 때문

    : 부르고자하는 컨트랙트가 같은 .sol 파일 내부에 있으면 따로 import도 안해도 되고
    : 부르고자하는 컨트랙트 소스코드를 알긴 아는데, 다른 .sol 파일에 있으면 import 해와서 사용하면 됨 (아래 예제는 import 해서 사용하는 예시)


    (문법-선언)
    : import {컨트랙트명} from {컨트랙트가 있는 .sol 파일 경로}

    (문법-할당)
    : 컨트랙트 주소를 TODO 2와 같이 컨트랙트 껍데기에 씌운 후 사용 가능

    (문법-호출)
    : 함수를 호출하듯, TODO 3와 같이 호출 가능
*/

// TODO 1 : Storage.sol 파일 내 Storage 컨트랙트 임포트
import {Storage} from "./Storage.sol";
/* -------------------------- */

contract Caller {

    function callSetValue(address _storageAddress, uint _value) public {
        // TODO 2 : 인자로 받은 storage 주소 값을 Storage 컨트랙트 껍데기에 씌우고 변수에 할당하기 (변수명 : storageContract)
        Storage storageContract = Storage(_storageAddress);
        // TODO 3 : setValue 호출해서 _value를 인자로 전달하기 ( 리턴 값 없음 )
        storageContract.setValue(_value);
    }

}