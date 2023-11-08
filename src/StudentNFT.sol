// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.21;

import {ERC721} from "openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import "./IStudentNft.sol";
contract StudentNFT is ERC721,IStudentNft {
	constructor() ERC721("HugoNFT", "hsch") {

	}
	
	function mint(uint256 tokenIdToMint) external {
        
        _mint(msg.sender, tokenIdToMint);
        
        
        
    }

	function burn(uint256 tokenIdToBurn) external
	{
        _burn(tokenIdToBurn);
    }
}