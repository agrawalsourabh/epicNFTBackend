// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "hardhat/console.sol";

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";


contract MyEpicNFT is ERC721URIStorage {

    using Counters for Counters.Counter;
    Counters.Counter private _tokenIDs;

    constructor() ERC721 ("SquareNFT", "SQUARE") {
        console.log("Welcome to the NFT contract");
    }

    function makeAnEpicNFT() public {
        uint256 newItemId = _tokenIDs.current();

        _safeMint(msg.sender, newItemId);

        _setTokenURI(newItemId, "https://jsonkeeper.com/b/TESK");

        console.log("An NFT w/ID %s has been minted to %s", newItemId, msg.sender);

        _tokenIDs.increment();


    }
}