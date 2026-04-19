// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
	enum Choices { Yes, No }
	
	struct Vote {
		Choices choice;
		address voter;
	}
	
	// TODO: create a public state variable: an array of votes
	Vote[] public votes;

	function createVote(Choices _choice) external {
		// 이미 투표했는지 확인
		require(!hasVoted(msg.sender), "Already voted");
		
		// TODO: add a new vote to the array of votes state variable
		votes.push(Vote(_choice, msg.sender));
	}

	function hasVoted(address _voter) public view returns (bool) {
		for(uint i=0; i<votes.length; i++) {
			if(votes[i].voter == _voter) return true;
		}
		return false;
	}

	function findChoice (address _voter) external view returns (Choices) {
		for(uint i=0; i<votes.length; i++) {
			if(votes[i].voter == _voter) {
				return votes[i].choice;
			}
		}
		revert("Vote not found");
	}

	function changeVote(Choices _choice) external {
		// 투표여부 확인
		require(hasVoted(msg.sender), "Have not voted yet");

		for(uint i=0; i<votes.length; i++) {
			if(votes[i].voter == msg.sender) {
				// storage 참조를 사용하여 직접 수정
				votes[i].choice = _choice;
				break;
			}
		}
	}
}