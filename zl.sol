// contracts/GameItem.sol
// SPDX-License-Identifier: MIT
// @author TJ
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ZLA1 is ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() ERC721("ZLAUNCH", "ZLAUNCH") {}

    function awardItem(address invitee, string memory tokenURI) public onlyOwner returns (uint256) {
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        _mint(invitee, newItemId);
        _setTokenURI(newItemId, tokenURI);

        return newItemId;
    }
}