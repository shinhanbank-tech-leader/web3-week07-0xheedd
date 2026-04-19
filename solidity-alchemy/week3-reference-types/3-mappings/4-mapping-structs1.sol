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
		require(!users[msg.sender].isActive, "Already Exist member");
		users[msg.sender] = newUser;
	}
}