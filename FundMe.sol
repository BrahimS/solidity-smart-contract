// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMe {
    /*
    Tasks:
    1 - Get funds from users
    2 - Withdraw funds
    3 - Set a minimum funding value un USD
    */
    address[] public funders;
    mapping(address funder => uint256 amountFunded)
        public addressToAmountFunded;
    uint256 public minimumUsd = 2e18;

    function fund() public payable {
        // Allowed users to send $
        // Have a minimum $ sent
        //// 1 - How do we send ETH to this contract
        require(
            getConversionRate(msg.value) >= minimumUsd,
            "You can't send less than 1 Ether"
        );
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] =
            addressToAmountFunded[msg.sender] +
            msg.value;
    }

    function getPrice() public view returns (uint256) {
        // address: 0x1b44F3514812d835EB1BDB0acB33d3fA3351Ee43
        AggregatorV3Interface priceFeed = AggregatorV3Interface(
            0x1b44F3514812d835EB1BDB0acB33d3fA3351Ee43
        );
        (, int256 price, , , ) = priceFeed.latestRoundData();
        return uint256(price * 1e18);
    }

    function getConversionRate(
        uint256 ethAmount
    ) public view returns (uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    }
}
