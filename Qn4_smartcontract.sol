// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EmployeeInfo {
    struct Employee {
        string name;
        uint256 age;
        string aadhar;
        address walletAddress;
    }

    address public admin;
    mapping(address => Employee) internal employees;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Admin only action");
        _;
    }

    function viewMyInfo() public view returns (string memory, uint256, string memory, address) {
        Employee memory employee = employees[msg.sender];
        return (employee.name, employee.age, employee.aadhar, employee.walletAddress);
    }

    function addEmployee(
        address userAddress,
        string memory name,
        uint256 age,
        string memory aadhar,
        address walletAddress
    ) public onlyAdmin {
        employees[userAddress] = Employee(name, age, aadhar, walletAddress);
    }

    function getEmployeeInfoAdmin(address userAddress) public view onlyAdmin returns (string memory, uint256, string memory, address) {
    Employee memory employee = employees[userAddress];
    return (employee.name, employee.age, employee.aadhar, employee.walletAddress);
    }
    
}
