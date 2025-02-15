// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";
import {PriceConverter} from "./libs/PriceConverter.sol";

contract FundMe {
    /*
    Tasks:
    1 - Get funds from users
    2 - Withdraw funds
    3 - Set a minimum funding value un USD
    */
    address public owner;

      // Constructor
    constructor() {
        owner =  msg.sender;
    }

    using PriceConverter for uint256;
    address[] public funders;


    mapping(address funder => uint256 amountFunded)
        public addressToAmountFunded;
    uint256 public minimumUsd = 2e18;

    function fund() public payable {
        // Allowed users to send $
        // Have a minimum $ sent
        //// 1 - How do we send ETH to this contract
        require(
            msg.value.getConversionRate() >= minimumUsd,
            "You can't send less than 1 Ether"
        );
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender]  += msg.value;
    }

    function withdaw() public onlyOwner {

        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++) {
            address funder = funders[funderIndex];
           addressToAmountFunded[funder] = 0;
        }
        // Rest the address Array
        funders = new address[](0);

        // transfer
        payable(msg.sender).transfer(address(this).balance);
        // send
        bool sendSuccess = payable(msg.sender).send(address(this).balance);
        require(sendSuccess, "Faild to send");
        // call
        (bool successCalled, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(successCalled, "Faild call");
    }

    // Modifier
    modifier onlyOwner() {
        require(msg.sender == owner, "Must be owner to perform this action");
        _;
    }

}
