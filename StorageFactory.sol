// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

// import other contract
import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory {
  SimpleStorage public simpleStorage;
  function createSimpleStorageContract() public {
    simpleStorage = new SimpleStorage();
  }
}
