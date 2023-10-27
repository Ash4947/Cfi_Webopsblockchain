// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Accreditation {
    struct Course {
        string name;
        uint credits;
        bool accredited;
    }
    //Maps address of course with course details and course accredtitation with student address
    mapping(address => mapping(string => Course)) public studentCourses;
    mapping(address => uint) public studentTotalCredits;

    function accreditCourse(
        address student,
        string memory courseName,
        uint courseCredits
    ) public {
        // Implement access control logic here to ensure only accrediting authorities can call this function.
        
        require(!studentCourses[student][courseName].accredited, "Course already accredited");
        
        studentCourses[student][courseName] = Course(courseName, courseCredits, true);
        studentTotalCredits[student] += courseCredits;
    }
    
    function getStudentCourse(address student, string memory courseName) public view returns (string memory, uint, bool) {
        Course memory course = studentCourses[student][courseName];
        return (course.name, course.credits, course.accredited);
    }
}
