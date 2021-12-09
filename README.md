# Principle
1. Should be fully decentrolized, at least within the on-chain contract:
    1. Once the contract is deployed, no one can change the function of the contract.
    2. If we want to add more function, just deploy a new version contract. Give the user right to choose the contract.

# Dumpling V1 interface

## Create trade(sell)
### Input
1. Single persons s/he wants to trade with, expressed by a wallet address.
2. **One** ERC721 token s/he owns, including:
    1. Token contract address.
    2. Token ID.
3. Price(In ETH).

### Output
A trade ID, which is unique inside the trade contract.

## Cancel trade(by seller)
1. Trade ID.

## Accept trade(buy)
### Input
1. Trade ID which the creator give to the acceptor.
2. Ether to pay for the trade, which must be exactly the price creator set.

### Output
The acceptor get the NFT token s/he want.
