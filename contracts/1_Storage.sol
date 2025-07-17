// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

import "./stringUtils.sol";

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */


 
contract Storage {

    string student_id;

    function store(string memory str_inp) public {
        student_id = str_inp;
    }


    function retrieve() public view returns (string memory){
        string memory my_id = "22101107";
        string memory my_name = "Mehedi Hasan Tanvir";
        string memory not_mine = "This is not your ID";
        if (StringUtils.equal(student_id, my_id)) {
            return my_name;
        } else {
            return not_mine;
        }
    }
}