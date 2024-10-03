// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract PrivateNFT is ERC721, ERC721Burnable, Ownable {
    constructor(address initialOwner)
        ERC721("cb149a469536c5d2a97b83b4436d9357a86c9a9bb65eb54f275a5e5be77fb51b","cb149a469536c5d2a97b83b4436d9357a86c9a9bb65eb54f275a5e5be77fb51b")
        Ownable(initialOwner)
    {}

    function safeMint(address to, uint256 tokenId) public onlyOwner {
        _safeMint(to, tokenId);
    }

    function balanceOf(address owner) public view override returns (uint256) {
        require(msg.sender == owner, "PrivateNFT: msg.sender != owner");
        return super.balanceOf(owner);
    }

    function ownerOf(uint256 tokenId) public view override returns (address) {
        address owner = super.ownerOf(tokenId);
        require(msg.sender == owner, "PrivateNFT: msg.sender != owner");
        return owner;
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        address owner = super.ownerOf(tokenId);
        require(msg.sender == owner, "PrivateNFT: msg.sender != owner");
        return super.tokenURI(tokenId);
    }
}
