// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "hardhat/console.sol";

import {Base64} from "./libraries/Base64.sol";

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";


contract MyEpicNFT is ERC721URIStorage {

    using Counters for Counters.Counter;
    Counters.Counter private _tokenIDs;

    constructor() ERC721 ("SquareNFT", "SQUARE") {
        console.log("Welcome to the NFT contract");
    }

    function makeAnEpicNFT(string memory _name, string memory _description, string memory _image) public {
        uint256 newItemId = _tokenIDs.current();

        _safeMint(msg.sender, newItemId);

        string memory json = Base64.encode(
        bytes(
                string(
                    abi.encodePacked(
                        '{"name": "',
                        _name,
                        '","description": "',_description,'", "image": "data:image/svg+xml;base64,',
                        // We add data:image/svg+xml;base64 and then append our base64 encode our svg.
                        _image,
                        '"}'
                    )
                )
            )
        );

        string memory uri = string(
            abi.encodePacked("data:application/json;base64,", json)
        );

        console.log("Metadata: " , uri);
        _setTokenURI(newItemId, uri);

        console.log("An NFT w/ID %s has been minted to %s", newItemId, msg.sender);

        _tokenIDs.increment();
    }
}