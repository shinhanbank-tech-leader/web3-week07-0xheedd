// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract StackClub {
    address[] members;

    constructor() {
        members.push(msg.sender);
    }

    function addMember (address newMember) external {
        if(isMember(msg.sender) == false) revert(); // 함수콜한사람이 멤버아니면 중단
        members.push(newMember);
    }

    function isMember (address member) public view returns (bool){
        bool result = false;
        for(uint i=0; i<members.length; i++){
            if(members[i] == member) {
                result = true;
                break;
            }
        }
        return result;
    }

    function removeLastMember () public {
        if(isMember(msg.sender) == false) revert(); // 함수콜한사람이 멤버아니면 중단
        members.pop();
    }
}