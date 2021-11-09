// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

    /*
    building out the minting function:
        a. nft to point to an address
        b. keep track of the token ids
        c. keep track of token owner addresses to token ids
        d. keep track of how many tokens an owner address has
        e. create an event that emits a transfer log - contract address, where it is being minted to the id.
    */

contract ERC721{


    event Transfer(
        address from, 
        address to, 
        uint256 tokenId);

    //mapping from token id to the owner
    mapping(uint256 => address) private _tokenOwner;

    //mapping from owner to number of owened 
    mapping(address => uint256) private _OwnedTokensCount;

    function _exists(uint256 tokenId) internal view returns(bool){
        address owner = _tokenOwner[tokenId];

        return owner != address(0);
    }

    function balanceOf(address _owner) public view returns(uint256){
        require(_owner != address(0), "owner query for non-exetent tokens");

        return _OwnedTokensCount[_owner];
    }

    function ownerOf(uint256 _tokenId) external view returns(address){
        address owner = _tokenOwner[_tokenId];
        require(owner != address(0), "owner query for non-exetent tokens");
        return owner;
    }

    function _mint(address to, uint256 tokenId) internal virtual{
        //requires that the address isn't zero
        require(to != address(0), "ERC721: minting to the zero address");
        require(!_exists(tokenId), "ERC721: token already minted");
        _tokenOwner[tokenId] = to;
        _OwnedTokensCount[to] += 1;

        emit Transfer(address(0), to, tokenId);
    }
}