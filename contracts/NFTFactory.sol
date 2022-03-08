// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "hardhat/console.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract NFT is ERC1155 {
    constructor(string memory tokenURI) public ERC1155(tokenURI) {
        console.log("deploy NFT");
    }

    function mint(uint256 tokenID, uint256 amount) external {
        _mint(msg.sender, tokenID, amount, "");
        console.log("mint NFT inside NFT contract");
    }
}

contract NFTFactory{
    event Deploy(address);

    constructor(){
        console.log("inside NFTFactory constructor");
    }

    function deployNFT(string memory tokenURI) external returns (address addr){
        NFT deployedNFT = new NFT(tokenURI);
        console.log("address: ", address(deployedNFT));
        addr = address(deployedNFT);

        emit Deploy(addr);
    }

    function mintNFT(address contractAddress, uint256 tokenID, uint256 amount) public {
        NFT nft = NFT(contractAddress);
        nft.mint(tokenID, amount);
    }
}