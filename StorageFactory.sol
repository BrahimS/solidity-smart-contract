// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

// import other contract
import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory {
    // SimpleStorage public simpleStorage;
    SimpleStorage[] public listOfSimpleStorageContracts;

    function createSimpleStorageContract() public {
        // simpleStorage = new SimpleStorage();
        SimpleStorage newSimpleStorageContract = new SimpleStorage();
        listOfSimpleStorageContracts.push(newSimpleStorageContract);
    }

    function SimpleForgeStore(
        uint256 _simpleStorageIndex,
        uint256 _newSimpleStorageNumber
    ) public {
        // In order to interfere with a contract, i will need two things:
        // 1 - Adress
        // 2 - ABI - Application Binary Interface
        // SimpleStorage mySimpleStorage = listOfSimpleStorageContracts[
        //     _simpleStorageIndex
        // ];
        // mySimpleStorage.store(_newSimpleStorageNumber);
        return
            listOfSimpleStorageContracts[_simpleStorageIndex].store(
                _newSimpleStorageNumber
            );
    }

    function getSimpleForege(
        uint256 _simpleStorageIndex
    ) public view returns (uint256) {
        // SimpleStorage mySimpleStorage = listOfSimpleStorageContracts[
        //     _simpleStorageIndex
        // ];
        // return mySimpleStorage.getFavorite256Num();
        return
            listOfSimpleStorageContracts[_simpleStorageIndex]
                .getFavorite256Num();
    }
}
