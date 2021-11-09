// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./ERC721Connector.sol";

contract Kryptobird is ERC721Connector{

    //array to store our nfts
    string [] public KryptoBirdz;

    mapping(string => bool) _KryptobirdzExists;

    function mint(string memory _KryptoBird) public{

        require(! _KryptobirdzExists[_KryptoBird],
        "Error -KryptoBird already exists");
        //this is deprecated - uint _id = KryptoBirdz.push(_KryotoBird);
        KryptoBirdz.push(_KryptoBird);
        uint _id = KryptoBirdz.length -1;

        _mint(msg.sender, _id);

        _KryptobirdzExists[_KryptoBird] = true;
    }

    constructor() ERC721Connector("KryptoBird", "KBIRDZ"){

    }

}