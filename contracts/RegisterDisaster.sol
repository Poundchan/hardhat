// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract RegisterDisaster {
    address public owner;   // เก็บข้อมูลของเจ้าของ Smart Contract (ใช้ใน Constructor)
    
    struct Person {
        string idCard;      // รหัสบัตรประชาชน
        string firstName;   // ชื่อ
        string lastName;    // นามสกุล
        string addr;        // ที่อยู่
    }

    Person[] private people; // สร้างตัวแปรอาเรย์ของประเภท Person เพื่อเก็บข้อมูลผู้คนที่จะลงทะเบียน
    mapping(string => uint256) private idToIndex; // สร้างตัวแปรแมพของประเภท uint256 เพื่อเก็บข้อมูลดัชนีของผู้คนตามรหัสบัตรประชาชน

    // Constructor to set the owner of the contract
    constructor() {
        owner = msg.sender; // Assign the contract deployer as the owner
    }

    // ฟังก์ชันสำหรับลงทะเบียนผู้เข้าร่วม
    function registerPerson(
        string memory _idCard, 
        string memory _firstName, 
        string memory _lastName, 
        string memory _address
    ) public {
        // Check if the person has already been registered
        require(idToIndex[_idCard] == 0, "Person is already registered");
        
        // Add the person to the array
        people.push(Person({
            idCard: _idCard,
            firstName: _firstName,
            lastName: _lastName,
            addr: _address
        }));

        // Store the person's index (people.length - 1)
        idToIndex[_idCard] = people.length;
    }

    // ฟังก์ชันสำหรับขอข้อมูลผู้เข้าร่วมทั้งหมด
    function getAll() public view returns (Person[] memory) {
        return people;
    }

    // ฟังก์ชันสำหรับขอข้อมูลผู้เข้าร่วมที่มี index ที่กำหนด (ควรอ้างอิง index จากการลงทะเบียน)
    function getPerson(uint256 index) public view returns (Person memory) {
        require(index < people.length, "Index out of bounds");
        return people[index];
    }

    // ฟังก์ชันสำหรับขอข้อมูลผู้เข้าร่วมที่มี idCard ที่กำหนด
    // ใช้ idToIndex เพื่อหาดัชนีของผู้เข้าร่วมที่มี idCard ตรงกัน
    function getID(string memory _idCard) public view returns (Person memory) {
        uint256 index = idToIndex[_idCard];
        require(index > 0, "Person not found"); 
        return people[index - 1]; // Adjust for zero-based index
    }
}