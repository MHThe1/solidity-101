// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

import "./stringUtils.sol";

contract IssueTracker {

    struct Issue {
        uint issueId;
        string description;
        string status;
    }

    mapping(uint => Issue) public issueList;

    function addIssue(uint _issueId, string memory _description, string memory _status) public {
        Issue memory newIssue = Issue({
            issueId: _issueId,
            description: _description,
            status: _status
        });

        issueList[_issueId] = newIssue;
    }

    function updateIssueStatus(uint _issueId, string memory _newStatus) public {
        Issue storage issue = issueList[_issueId];

        require(bytes(issue.description).length != 0, "Issue does not exist");

        string memory currentStatus = issue.status;

        if (
            StringUtils.equal(currentStatus, "ACTIVE") &&
            StringUtils.equal(_newStatus, "IN_PROGRESS")
        ) {
            issue.status = _newStatus;
        } else if (
            StringUtils.equal(currentStatus, "IN_PROGRESS") &&
            StringUtils.equal(_newStatus, "COMPLETE")
        ) {
            issue.status = _newStatus;
        } else if (
            StringUtils.equal(currentStatus, "COMPLETE") &&
            StringUtils.equal(_newStatus, "CLOSED")
        ) {
            issue.status = _newStatus;
        } else {
            revert("Invalid status transition");
        }
    }
}
