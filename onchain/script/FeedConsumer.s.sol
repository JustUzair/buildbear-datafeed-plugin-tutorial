// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "forge-std/Script.sol";
import {FeedConsumer} from "../src/FeedConsumer.sol";

contract FeedConsumerScript is Script {
    function run() external {
        // Read mnemonic from .env
        string memory mnemonic = vm.envString("MNEMONIC");

        // Derive private key from mnemonic (index 0)
        uint256 deployerPrivateKey = vm.deriveKey(mnemonic, 0);
        vm.startBroadcast(deployerPrivateKey);

        // Chainlink Feed address for USDT/ETH (change as needed)
        address priceFeedAddress = 0xEe9F2375b4bdF6387aa8265dD4FB8F16512A1d46;

        // Deploy the contract
        FeedConsumer consumer = new FeedConsumer(priceFeedAddress);
        console.log("Deployed FeedConsumer at:", address(consumer));

        // Consume values from the deployed contract
        string memory desc = consumer.getDescription();
        uint8 decimals = consumer.getDecimals();
        uint256 formattedPrice = consumer.getFormattedPrice();
        uint256 unitPrice = consumer.getUnitPrice();

        // Log the values
        console.log("Feed Description:", desc);
        console.log("Feed Decimals:", uint256(decimals));
        console.log("Formatted Price (scaled 18d):", formattedPrice);
        console.log("Unit Price (scaled 18d):", unitPrice);

        vm.stopBroadcast();
    }
}
