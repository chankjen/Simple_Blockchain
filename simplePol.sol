// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimplePoll {
    struct Poll {
        string question;
        string[] options;
        uint256[] votes;
        address creator;
    }

    Poll[] public polls;

    // Events enable transparent tracking on the blockchain
    event PollCreated(uint256 pollId, string question, address creator);
    event Voted(uint256 pollId, uint256 optionIndex, address voter);

    // Create a new poll
    function createPoll(string memory _question, string[] memory _options) public {
        require(_options.length > 1, "At least 2 options required");
        uint256[] memory initialVotes = new uint256[](_options.length);
        polls.push(Poll(_question, _options, initialVotes, msg.sender));
        emit PollCreated(polls.length - 1, _question, msg.sender);
    }

    // Cast a vote (anyone can vote once per poll in a real system, simplified here)
    function vote(uint256 _pollId, uint256 _optionIndex) public {
        require(_pollId < polls.length, "Poll does not exist");
        require(_optionIndex < polls[_pollId].options.length, "Invalid option");
        polls[_pollId].votes[_optionIndex]++;
        emit Voted(_pollId, _optionIndex, msg.sender);
    }

    // Read poll results
    function getPoll(uint256 _pollId) public view returns (string memory question, string[] memory options, uint256[] memory votes) {
        require(_pollId < polls.length, "Poll does not exist");
        Poll p = polls[_pollId];
        return (p.question, p.options, p.votes);
    }
}