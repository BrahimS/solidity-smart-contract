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
}
