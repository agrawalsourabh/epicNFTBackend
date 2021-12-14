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

        _setTokenURI(newItemId, "data:application/json;base64,ewogICAgIm5hbWUiOiAiTXlUZXh0TkZUIiwKICAgICJkZXNjcmlwdGlvbiI6ICJNeVRleHRORlQgaXMgYSBzeXN0ZW0gZ2VuZXJhdGVkIHRleHQgaW1hZ2UiLAogICAgImltYWdlIjogImRhdGE6aW1hZ2Uvc3ZnK3htbDtiYXNlNjQsUEhOMlp5QjRiV3h1Y3owaWFIUjBjRG92TDNkM2R5NTNNeTV2Y21jdk1qQXdNQzl6ZG1jaUlIQnlaWE5sY25abFFYTndaV04wVW1GMGFXODlJbmhOYVc1WlRXbHVJRzFsWlhRaUlIWnBaWGRDYjNnOUlqQWdNQ0F6TlRBZ016VXdJajRLSUNBZ0lEeHpkSGxzWlQ0dVltRnpaU0I3SUdacGJHdzZJSGRvYVhSbE95Qm1iMjUwTFdaaGJXbHNlVG9nYzJWeWFXWTdJR1p2Ym5RdGMybDZaVG9nTVRSd2VEc2dmVHd2YzNSNWJHVStDaUFnSUNBOGNtVmpkQ0IzYVdSMGFEMGlNVEF3SlNJZ2FHVnBaMmgwUFNJeE1EQWxJaUJtYVd4c1BTSmliR0ZqYXlJZ0x6NEtJQ0FnSUR4MFpYaDBJSGc5SWpVd0pTSWdlVDBpTlRBbElpQmpiR0Z6Y3owaVltRnpaU0lnWkc5dGFXNWhiblF0WW1GelpXeHBibVU5SW0xcFpHUnNaU0lnZEdWNGRDMWhibU5vYjNJOUltMXBaR1JzWlNJK1RYbFVaWGgwVGtaVVBDOTBaWGgwUGdvOEwzTjJaejQ9Igp9");

        console.log("An NFT w/ID %s has been minted to %s", newItemId, msg.sender);

        _tokenIDs.increment();
    }
}