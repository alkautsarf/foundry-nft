# IPFS NFT and On-Chain NFT

This repo contains 2 contracts :

- Basic NFT : An IPFS Hosted NFT

- Mood NFT : An SVG NFT (Hosted 100% on-chain)

## Commands

- Compile

    ```
    forge build
    ```
- Test

    ```
    forge test
    ```
- Deploy

    ```
    forge script script/DeployMoodNft.s.sol:DeployMoodNft --rpc-url $SEPOLIA_RPC_URL --account defaultKey --sender $MAIN_ADDRESS --verify --etherscan-api-key $ETHERSCAN_API_KEY --broadcast
    ```