// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentRegistry {
    // Struct to represent a student
    struct Student {
        uint256 regID;
        string name;
        string course;
        string mobileNo;
    }

    // Mapping to store students using their registration ID
    mapping(uint256 => Student) public students;

    // Event to log student registration
    event StudentRegistered(uint256 regID, string name, string course, string mobileNo);

    // Function to register a new student
    function registerStudent(uint256 _regID, string memory _name, string memory _course, string memory _mobileNo) public {
        // Check if the registration ID already exists
        require(students[_regID].regID == 0, "Student with this registration ID already exists");

        // Create a new student
        Student memory newStudent = Student({
            regID: _regID,
            name: _name,
            course: _course,
            mobileNo: _mobileNo
        });

        // Store the new student in the mapping
        students[_regID] = newStudent;

        // Emit an event to log the registration
        emit StudentRegistered(_regID, _name, _course, _mobileNo);
    }

    // Function to retrieve student details by registration ID
    function getStudentDetails(uint256 _regID) public view returns (uint256, string memory, string memory, string memory) {
        // Check if the student exists
        require(students[_regID].regID != 0, "Student with this registration ID does not exist");

        // Return the student details
        return (
            students[_regID].regID,
            students[_regID].name,
            students[_regID].course,
            students[_regID].mobileNo
        );
    }
}
