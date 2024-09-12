// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "forge-std/console2.sol";
import "@pangolin/pangolin-periphery/interfaces/IPangolinRouter.sol";
import "@pangolin/pangolin-core/interfaces/IPangolinPair.sol";
import "@pangolin/pangolin-core/interfaces/IPangolinFactory.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";



//  **********************************************************************************************
// Avalanche Fuji testnet constants:
//  **********************************************************************************************
    library Constants {

    address constant MYACCOUNT = 0x95c694C18ef33bC9280a948E1c14F5bA07e62B83;
    
    address constant PAIR_WABAX_JOE = 0x295Bfc4A2344642F44f66395AdF0c29939f3faeA;
    address constant WABAX = 0xd00ae08403B9bbb9124bB305C09058E32C39A48c;    // 18 dec

    address constant JOE = 0xEa81F6972aDf76765Fd1435E119Acc0Aafc80BeA;   // 18 dec
    address constant UNI = 0xf4E0A9224e8827dE91050b528F34e2F99C82Fbf6; // Uniswap 18 dec

    address constant PANGOLIN_ROUTER = 0x2D99ABD9008Dc933ff5c0CD271B88309593aB921;
    address constant PANGOLIN_FACTORY = 0xE4A575550C2b460d2307b82dCd7aFe84AD1484dd;

    }




