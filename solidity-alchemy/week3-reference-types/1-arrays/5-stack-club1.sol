// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract StackClub {
    address[] members;

    function addMember (address newMember) external {
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
}