// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/interfaces/IERC721.sol";
import {Address} from "@openzeppelin/contracts/utils/Address.sol";

contract DumplingPeerToPeerTradeV1 {
    uint256 public tradeCount = 0;

    struct Trade {
        address seller;
        address buyer;
        address tokenAddress;
        uint256 tokenId;
        uint256 price;
        bool closed;
    }

    mapping(uint256 => Trade) tradeIdToTrade;

    function Sell(
        address buyer,
        address tokenAddress,
        uint256 tokenId,
        uint256 price
    ) public returns (uint256/*trade ID*/) {
        require(!Address.isContract(buyer), "Buyer can not be contract address!");

        tradeIdToTrade[tradeCount] =
            Trade(msg.sender/*seller*/, buyer, tokenAddress, tokenId, price, false/*closed*/);

        tradeCount++;
        return tradeCount;
    }

    function Cancel(uint256 tradeId) public {
        require(!tradeIdToTrade[tradeId].closed);
        require(tradeIdToTrade[tradeId].seller == msg.sender);

        tradeIdToTrade[tradeId].closed = true;
    }

    function Buy(uint256 tradeId) public payable {
        Trade memory trade = tradeIdToTrade[tradeId];

        require(!trade.closed);
        require(msg.sender == trade.buyer);
        require(msg.value == trade.price);

        IERC721(trade.tokenAddress).safeTransferFrom(trade.seller, trade.buyer, trade.tokenId);

        (bool success,) = payable(trade.seller).call{value: msg.value}("");
        require(success, "Transfer failed!");

        tradeIdToTrade[tradeId].closed = true;
    }
}