/**
 * OnRampTrader
 *          Gubbi Contrat 
 *          Payments on Gubbi  ecosystem are to be conducted on a USDC token basis. So Onramping balances to Gubbi should be converted to USDC. This
 *          will allow standardization in payments and transfers as users won't see any crypto on wallet but a USD / MNX peso balance that they could use
 *          OnRampTrader interchange tokens sent to user account to USDC. It is expected users sending remittances from abroad will be able to send in several kinds of tokens to 
 *          Gubbi Users. 
 *          Presently, and as a PoC, this contract allows interchange a Pair Wabax / Joe. Next versions will allow more tokens to be echanged for USDC
 */
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "forge-std/console2.sol";
import "@pangolin/pangolin-periphery/interfaces/IPangolinRouter.sol";
import "@pangolin/pangolin-core/interfaces/IPangolinPair.sol";
import "@pangolin/pangolin-core/interfaces/IPangolinFactory.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

import "../lib/constantsTestnet.sol";
import "../lib/ITokenERC20forTesting.sol";



contract OnRampTrader {

    IPangolinPair Pair_WABAX_JOE = IPangolinPair(Constants.PAIR_WABAX_JOE);
    ITokenERC20forTesting contratoERC20_WABAX = ITokenERC20forTesting(Constants.WABAX);
    ITokenERC20forTesting contratoERC20_JOE = ITokenERC20forTesting(Constants.JOE);
    
    IPangolinRouter private constant router = IPangolinRouter(Constants.PANGOLIN_ROUTER);

    function TradePair(address T1, address T2, uint256 amountIn, uint256 amounMin, address recipient) public {
        
    }

}
