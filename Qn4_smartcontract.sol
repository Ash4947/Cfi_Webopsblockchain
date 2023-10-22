// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0; 

//Creating a structure to store details
contract EmployeeInfo {
    struct Employee {
        string name;
        uint256 age;
        string aadhar;
        address walletAddress;
    }

    //Mapping the structure to the addresses of the employees
    address public admin;
    mapping(address => Employee) internal employees;

    //Constructor to identify admin
    constructor() {
        admin = msg.sender;
    }

    //modifier for admin only actions
    modifier onlyAdmin() {
        require(msg.sender == admin, "Admin only action");
        _;
    }

    //function for employees to view their own details
    function viewMyInfo() public view returns (string memory, uint256, string memory, address) {
        Employee memory employee = employees[msg.sender];
        return (employee.name, employee.age, employee.aadhar, employee.walletAddress);
    }

    //admin only function to add new employee details
    function addEmployee(
        address userAddress,
        string memory name,
        uint256 age,
        string memory aadhar,
        address walletAddress
    ) public onlyAdmin {
        employees[userAddress] = Employee(name, age, aadhar, walletAddress);
    }

    //admin only function to view details of any employee
    function getEmployeeInfoAdmin(address userAddress) public view onlyAdmin returns (string memory, uint256, string memory, address) {
    Employee memory employee = employees[userAddress];
    return (employee.name, employee.age, employee.aadhar, employee.walletAddress);
    }
    
}
