// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

import "./stringUtils.sol";

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */


 
contract Storage {

    // string student_id;

    mapping (string => string) students;

    function store(string memory student_name, string memory student_id) public {
        students [student_id] = student_name;
    }


    function retrieve(string memory student_id) public view returns (string memory){
        return students[student_id];
    }
}