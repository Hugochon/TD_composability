// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.21;

import "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import "./IStudentToken.sol";

contract StudentToken is ERC20, IStudentToken {

    uint256 INITIAL_SUPPLY = 1000000 * (10 ** 18);
    address evaluator_address = 0x5cd93e3B0afBF71C9C84A7574a5023B4998B97BE;


    constructor() ERC20("StarDucks Cappucino Token", "CAPPU") {
        _mint(msg.sender, INITIAL_SUPPLY - INITIAL_SUPPLY/10);
        _mint(address(this), INITIAL_SUPPLY/10);
        _approve(address(this), evaluator_address, INITIAL_SUPPLY);
       
    }

    function createLiquidityPool() external {
        
    }

	function SwapRewardToken() external{

        

    }
}