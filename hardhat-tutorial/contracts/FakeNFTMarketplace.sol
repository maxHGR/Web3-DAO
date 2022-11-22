//SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

contract FakeNFTMarketplace {
    // Maps tokenIDs to Owners
    mapping(uint256 => address) public tokens;

    uint256 nftPrice = 0.001 ether;

    // purchase() takes some ETH, and marks the msg.sender address
    // as the owner of some NFT
    function purchase(uint256 _tokenId) external payable {
        require(msg.value == nftPrice, "NOT_ENOUGH_ETH");
        // check if token isn´t alreay sold, so the token
        // is still in the 0-address, where it gets minted from
        require(tokens[_tokenId] == address(0), "NOT_FOR_SALE");

        tokens[_tokenId] = msg.sender;
    }

    function getPrice() external view returns (uint256) {
        return nftPrice;
    }
 
    function available(uint256 _tokenId) external view returns (bool) {
       // hasn´t been sold to someone yet
        if (tokens[_tokenId] == address(0)) {
            return true;
        }
        return false;
    }

}