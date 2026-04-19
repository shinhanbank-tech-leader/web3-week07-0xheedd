// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Sidekick {
    function makeContact(address hero) external {
        // TODO: trigger the hero's fallback function!
        // fallback : 함수나 데이터 호출할때 받아주는,,
        (bool success, ) = hero.call("");

        require(success, "makeContract Failed");
    }
}