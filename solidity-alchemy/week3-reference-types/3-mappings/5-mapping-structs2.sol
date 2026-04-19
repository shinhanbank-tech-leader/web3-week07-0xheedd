// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
	struct User {
		uint balance;
		bool isActive;
	}

    mapping(address => User) public users;
     
	function createUser() external {
		User memory newUser = User(100, true);

		// 이미 존재하는 유져면 revert
		require(users[msg.sender].isActive == false, "Already Exist member");
		users[msg.sender] = newUser;
	}

	function transfer(address recipient, uint amount) external {
		// sender, recipient active하지 않으면 revert
		require(users[msg.sender].isActive, "sender is not active");
		require(users[recipient].isActive, "recipient is not active");
		// 잔액이 보낼 금액보다 크거나 같은지 확인
		require(users[msg.sender].balance >= amount, "Not enough sender's balance");

		users[msg.sender].balance -= amount; // 내 잔액 먼저 차감
		users[recipient].balance += amount;  // 상대방 잔액 증가
	}
}