// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SentimentVoting {
    string public proposal = "Should we implement AI moderation?";
    uint public yesVotes;
    uint public noVotes;
    mapping(address => bool) public hasVoted;

    function vote(bool _voteYes) public {
        require(!hasVoted[msg.sender], "You have already voted");

        uint weight = 1; // Default weight
        if (_voteYes) {
            weight = 2; // Positive votes get double weight
            yesVotes += weight;
        } else {
            noVotes += weight;
        }

        hasVoted[msg.sender] = true;
    }

    function getResults() public view returns (string memory, uint, uint) {
        return (proposal, yesVotes, noVotes);
    }
}
