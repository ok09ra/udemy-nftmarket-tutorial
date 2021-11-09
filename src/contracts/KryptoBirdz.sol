// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./ERC721Connector.sol";

contract Kryptobird is ERC721Connector{

    //array to store our nfts
    string [] public Kryptobirdz;

    mapping(string => bool) _KryptobirdzExists;


    function mint(string memory _KryotoBird) public{

        require*(! _KryptobirdzExists[_Kryptobird],
        "Error =KryptoBird already exists");
        //this is deprecated - uint _id = KryptoBirdz.push(_KryotoBird);
        kryptoBirdz.push(_KryptoBird);
        uint _id = KryptoBirdz.length -1;

        _mint(msg.sender, _id);

        _KryptoBirdzExists[_KryptoBird] = true;
    }

    constructor() ERC721Connector("KryptoBird", "KBIRDZ"){

    }

}