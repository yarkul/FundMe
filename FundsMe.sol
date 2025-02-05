//SPD-License-Identifier: MIT

// SPDX-License-Identifier: MIT
pragma solidity  ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMe {

    uint256 public minimumUsdt = 5;

    function fund() public payable  {
        require (msg.value > minimumUsdt, "don't enougth ETH");
    }

    function getPrice() public view returns(uint256) {
        //0x694AA1769357215DE4FAC081bf1f309aDC325306
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306); 
        (,int256 answer,,,) = priceFeed.latestRoundData();

        return uint256(answer * 1e10);
    }

    function getPriceConversion() public {

    }
}