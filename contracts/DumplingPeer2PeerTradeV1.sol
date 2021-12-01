// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract DumplingPeer2PeerTradeV1 is Ownable {
    uint256 public _tradeCounter = 0;

    function CreateTrade(
        address tokenAddress,
        uint256 tokenId,
        address acceptor,
        uint256 royalty,
        address artistAddress,
        uint256 donation,
        uint256 durationInSec
    ) public returns (uint256/* trade ID */) {
        _tradeCounter++;
        return _tradeCounter;
    }

    function CancelTrade(uint256 tradeId) public {}

    function AcceptTrade(uint256 tradeId) public payable {}
}