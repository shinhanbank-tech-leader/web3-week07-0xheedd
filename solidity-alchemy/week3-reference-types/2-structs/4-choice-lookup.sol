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
		// TODO: add a new vote to the array of votes state variable
		Vote memory vote = Vote(_choice, msg.sender);
		votes.push(vote);
	}

	function hasVoted(address _voter) external view returns (bool) {
		bool result = false;
		for(uint i=0; i<votes.length; i++) {
			if(votes[i].voter == _voter) {
				result = true;
				break;
			}
		}
		return result;
	}

	function findChoice (address _voter) external view returns (Choices) {
		Choices choice;
		for(uint i=0; i<votes.length; i++) {
			if(votes[i].voter == _voter) {
				choice = votes[i].choice;
				break;
			}
		}
		return choice;
	}
}