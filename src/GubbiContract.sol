/**
 * OnRampTrader
 *          Gubbi Contrat 
 *        
 */
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "forge-std/console2.sol";
import "@pangolin/pangolin-periphery/interfaces/IPangolinRouter.sol";
import "@pangolin/pangolin-core/interfaces/IPangolinPair.sol";
import "@pangolin/pangolin-core/interfaces/IPangolinFactory.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


import "../lib/constantsTestnet.sol";
import "../lib/ITokenERC20forTesting.sol";

contract GubbiContract is Ownable {

    IPangolinPair Pair_WABAX_JOE = IPangolinPair(Constants.PAIR_WABAX_JOE);
    ITokenERC20forTesting contratoERC20_WABAX = ITokenERC20forTesting(Constants.WABAX);
    ITokenERC20forTesting contratoERC20_JOE = ITokenERC20forTesting(Constants.JOE);
    IPangolinRouter private constant router = IPangolinRouter(Constants.PANGOLIN_ROUTER);

      mapping(address => bool)  public GubbiUsers;         // To interact with Gubbi contract must have a registered account

      error NotRegisteredUser();
      error RecipientNotRegisteredUser();
      error BadParams();

    modifier onlyUsers() {
        if (!GubbiUsers[msg.sender]) revert NotRegisteredUser();
        _;
    }
constructor() Ownable(msg.sender) {
}

/**
 * 
 * @param _user Address of new account
 */

function registerUser(address _user) public onlyOwner {
    GubbiUsers[_user] = true;
}


/**
 * 
 * @param Token1 Token In
 * @param Token2 Token Out
 * @param _amountIn  Quantity of tokens to trade
 * @param _amounMin  Minimun quantity of tokens to accept in the trade
 * @param _recipient Address to send trade out
 */

/*  Payments on Gubbi  ecosystem are to be conducted on a USDC token basis. So Onramping balances to Gubbi should be converted to USDC. This
*    will allow standardization in payments and transfers as users won't see any crypto on wallet but a USD / MNX peso balance that they could use
*    OnRampTrader interchange tokens sent to user account to USDC. It is expected users sending remittances from abroad will be able to send in several kinds of tokens to 
*    Gubbi Users. 
*    Presently, and as a PoC, this contract allows interchange a Pair Wabax / Joe. Next versions will allow more tokens to be echanged for USDC
*/

function OnRampTrader(address Token1, address Token2, uint256 _amountIn, uint256 _amounMin, address _recipient) public   {
    if (Token1 == address(0) || Token2 == address(0) || _recipient == address(0)) revert BadParams();
            address[] memory path = new address[](2);
            path[0] = Token1;
            path[1] = Token2;
            uint[] memory amountsExchanged = new uint[](2);
             IERC20(Token1).transferFrom(msg.sender, address(this), _amountIn);
            uint256 allowanceAmount = contratoERC20_WABAX.allowance(msg.sender, address(this));
            // ahora transfiere el allowanced token a Gubbi
            IERC20(Token1).transferFrom(msg.sender, address(this), _amountIn);
            // ahora Gubbi permite al router el allowance
             contratoERC20_WABAX.approve(Constants.PANGOLIN_ROUTER , type(uint256).max);
            allowanceAmount = contratoERC20_WABAX.allowance(address(this),  Constants.PANGOLIN_ROUTER);
            amountsExchanged = router.swapExactTokensForTokens(
                    _amountIn,
                    _amounMin,
                    path,
                    _recipient,
                    block.timestamp);
 }
}
 


