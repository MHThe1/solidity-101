// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

import "./stringUtils.sol";

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */


 
contract Storage {

    uint student_id;

    function store(uint256 id) public {
        student_id = id;
    }


    function retrieve() public view returns (string memory){
        uint last_two = (student_id % 100);
        string memory my_name = "Mehedi Hasan Tanvir";
        string memory not_mine = "Not found!";
        if (student_id % last_two == 0) {
            return my_name;
        } else {
            return not_mine;
        }
    }
}