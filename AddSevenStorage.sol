// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {SimpleStorage} from "./SimpleStorage.sol";

contract AddSevenStorage is SimpleStorage {
    // Inheritance
    function store(uint256 _favorite256Num) public override {
        favorite256Num = _favorite256Num + 7;
    }
}
