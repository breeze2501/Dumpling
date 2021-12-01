# Principle
1. Should be fully decentrolized, at least within the on-chain contract:
    1. Once the contract is deployed, no one can change the function of the contract.
    2. If we want to add more function, just deploy a new version contract. Give the user right to choose the contract.

# Dumpling V1 interface

## Trade creator
### input
1. **One** ERC721 token s/he owns, including:
    1. Token contract address.
    2. Token ID.
2. Price(In ETH).
3. Single persons s/he wants to trade with, expressed by a wallet address.
4. Royalty. The royalty you want to give to the NFT author, which is 100% decided by u.
5. Donation. In place of platfrom fee. We use donation, which is also 100% decided by u.

### output
A trade ID, which is unique inside the trade contract.

## Trade acceptor
### input
1. Trade ID which the creator give to the acceptor.
2. Ether to pay for the trade, which must be exactly the price creator set.

### output
The acceptor get the NFT token s/he want.
