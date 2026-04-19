// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Sidekick {
    function sendAlert(address hero, uint enemies, bool armed) external {
        
        (bool success, ) = hero.call(
            /* TODO: alert the hero with the proper calldata! */
            // uint256은 uint로 줄여쓸 수 있지만, abi로 함수 시그니쳐 딸때는 풀네임으로 적어야됨 (uin256)
            abi.encodeWithSignature("alert(uint256,bool)", enemies, armed)
        );

        require(success, "Failed to call alert()");
    }
}