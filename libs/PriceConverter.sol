// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";


library PriceConverter {

    using PriceConverter for uint256;

    function getConversionRate(
            uint256 ethAmount
        ) internal view returns (uint256) {
            uint256 ethPrice = getPrice();
            uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
            return ethAmountInUsd;
        }


    function getPrice() internal view returns (uint256) {
        // address: 0x1b44F3514812d835EB1BDB0acB33d3fA3351Ee43
        AggregatorV3Interface priceFeed = AggregatorV3Interface(
            0x1b44F3514812d835EB1BDB0acB33d3fA3351Ee43
        );
        (, int256 price, , , ) = priceFeed.latestRoundData();
        return uint256(price * 1e18);
    }

}
