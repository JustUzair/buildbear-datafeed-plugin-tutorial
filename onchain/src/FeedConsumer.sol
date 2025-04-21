// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {AggregatorV3Interface} from "@chainlink/interfaces/feeds/AggregatorV3Interface.sol";

contract FeedConsumer {
    AggregatorV3Interface public priceFeed;

    constructor(address _priceFeedAddress) {
        priceFeed = AggregatorV3Interface(_priceFeedAddress);
    }

    function getPrice() public view returns (int256) {
        (, int256 answer,,,) = priceFeed.latestRoundData();
        return answer;
    }

    function getDecimals() public view returns (uint8) {
        return priceFeed.decimals();
    }

    function getDescription() public view returns (string memory) {
        return priceFeed.description();
    }

    function getFormattedPrice() public view returns (uint256) {
        int256 rawPrice = getPrice();
        uint8 decimals = getDecimals();
        require(rawPrice > 0, "Invalid price");

        return uint256(rawPrice) * 1e18 / (10 ** decimals);
    }

    function getConversionRate(uint256 amountInBaseToken) public view returns (uint256) {
        int256 rawPrice = getPrice();
        uint8 decimals = getDecimals();
        require(rawPrice > 0, "Invalid price");

        return (amountInBaseToken * uint256(rawPrice) * 1e18) / (10 ** decimals);
    }

    // 🔥 NEW: Get price of *1 unit* of quote token in base token (scaled to 18 decimals)
    function getUnitPrice() public view returns (uint256) {
        uint256 formattedPrice = getFormattedPrice();
        require(formattedPrice > 0, "Zero price");

        // Equivalent to: 1e36 / price, to preserve 18-dec precision
        return 1e36 / formattedPrice;
    }
}
