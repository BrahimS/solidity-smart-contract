// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract SimpleStorage {
    // Basic types: boolean, uint8, uint16, uint256,int,string, address, bytes
    bool isFavorites = true;
    uint8 favorit8eNum = 0x3C;
    uint16 favorit16eNum = 0x3C44;
    address myAddress = 0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC;
    bytes32 myString = "Hello, World!";
    string myFavoriteText = "This is a long text";

    uint256 public favorite256Num;
    mapping(string => uint16) public nameToAge;

    // Transaction function: stores a new value for favorite256Num
    function store(uint256 _favorite256Num) public {
        favorite256Num = _favorite256Num;
    }

    // view function: returns the current value of favorite256Num
    function getFavorite256Num() public view returns (uint256) {
        return favorite256Num;
    }

    struct Person {
        string name;
        uint16 age;
        address addressBookAddress;
    }

    // Dynamic array
    Person[] public myPersonList;

    // Static array
    // Person[3] public myPersonList;
    function addPerson(
        string memory _name,
        uint16 _age,
        address _addressBookAddress
    ) public {
        myPersonList.push(Person(_name, _age, _addressBookAddress));
        nameToAge[_name] = _age;
    }
}
