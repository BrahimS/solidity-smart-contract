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
        addressToAmountFunded[msg.sender] =
            addressToAmountFunded[msg.sender] +
            msg.value;
    }

}
