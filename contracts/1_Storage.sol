// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

import "./stringUtils.sol";

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */


 
contract Storage {

    struct Student {
        // gpa: string, semesterName: string, studentID:uint, courseTaken: uint
        string gpa;
        string semesterName;
        uint studentID;
        uint courseTaken;
    }

    Student[] semesterData;

  function addStudent(string memory _gpa, string memory semesterName, uint256 _studentID, uint _courseTaken ) public {
       Student memory newStudentSem = Student( _gpa, semesterName, _studentID, _courseTaken );
       semesterData.push( newStudentSem );
  }

   function getStudents() public view returns(Student[] memory){
       return semesterData;

   }
}