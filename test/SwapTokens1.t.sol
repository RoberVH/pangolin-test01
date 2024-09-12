
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "forge-std/console2.sol";
import "@pangolin/pangolin-periphery/interfaces/IPangolinRouter.sol";
import "@pangolin/pangolin-core/interfaces/IPangolinPair.sol";
import "@pangolin/pangolin-core/interfaces/IPangolinFactory.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "./constantsTestnet.sol";


    // BTCs have 8 decimals
    // USD stable coins have 6 decimals
    // ETH have 18 decimals

contract PangolinTests is Test {


    IPangolinPair Pair_WABAX_JOE = IPangolinPair(Constants.PAIR_WABAX_JOE);
    IERC20 contratoERC20_WABAX = IERC20(Constants.WABAX);
    IPangolinRouter private constant router = IPangolinRouter(Constants.PANGOLIN_ROUTER);
                                                     

    function setUp() public {
    }

    function getIntDec(uint balance, uint decimals) private pure{
        uint integerPart = balance / decimals;
        uint decimalPart = balance % decimals;
        console2.log("Converted cant :",integerPart,'.', decimalPart);
        //console.log(integerPart,'.', decimalPart);
    }

    function getBalancesonTokens() private view {
         console2.log("Geting my Account Balances on Pair");
         uint balanceWABAX = contratoERC20_WABAX.balanceOf(Constants.MYACCOUNT);
         uint balanceJOE = contratoERC20_WABAX.balanceOf(Constants.MYACCOUNT);
         console2.log('Balance Wabax:', balanceWABAX);
         getIntDec(balanceWABAX,1e18);
         console2.log('Balance JOE:', balanceJOE);
         getIntDec(balanceJOE,1e18);

    }

    function test_getAmountsOut() public view {
        address[] memory path = new address[](2);
        path[0] = Constants.WABAX;
        console2.log("getAmountsOut using Path");
        path[1] = Constants.JOE;
        uint256 amountIn =  80_000_000_000_000_000  ;   
        console2.log('Sending token Wabax In:', amountIn);
        getIntDec(amountIn, 1e18);
        // get output amount using more path of pair
        uint[] memory amounts = router.getAmountsOut(amountIn, path);
        console2.log("Out", amounts[1]);
        getIntDec(amounts[1], 1e18);
    }

        function test_getAmountOut() public view {
        console2.log("getAmountOut using Reserves");
        // get reserves
          (uint112 _reserve0, uint112 _reserve1,)= Pair_WABAX_JOE.getReserves();
         console2.log('reserve0', _reserve0);
         getIntDec(_reserve0,1e18);
         console2.log('reserve1', _reserve1);
         getIntDec(_reserve1,1e18);
         uint256 amountIn =  80_000_000_000_000_000  ;   
         console2.log('Sending token Wabax In:');
         getIntDec(amountIn, 1e18);
         uint amountOutput = router.getAmountOut(amountIn, _reserve0, _reserve1);
        console2.log('getAmountOUT', amountOutput);
         getIntDec(amountOutput, 1e18);

        }
        
        function exchangeTokens() public pure{
            console2.log('Exchange tokens pending');
        //     uint256 currentTime = block.timestamp;
        //  uint256 amountOutMin =  amounts[1] -  10000000000000000;   
        //  console2.log("Monto minimo a recibir", amountOutMin );

        // // get output amount using only two pairs
        //  console2.log("getAmountOut using only two pairs");

        //     router.swapExactTokensForTokens(
        //     amountIn,        // Monto exacto de tokens a intercambiar
        //     amountOutMin,    // Monto mínimo que aceptas recibir
        //     path,            // Camino de intercambio
        //     0x95c694C18ef33bC9280a948E1c14F5bA07e62B83,              // Dirección del destinatario
        //     currentTime + 300         // Plazo para completar el swap
        // );

    }

    /* function getExpectedTokens(uint256 usdcAmount) public view returns (uint256) {
        address[] memory path = new address[](2);
        path[0] = USDC;
        path[1] = WETH_E;

        uint256[] memory amounts = router.getAmountsIn(usdcAmount, path);
        return amounts[0]; // Amount of WETH.e needed
    }

    function swapTokens(uint256 usdcAmount) public returns (uint256) {
        // Approve router to spend USDC
        usdc.approve(address(router), usdcAmount);

        address[] memory path = new address[](2);
        path[0] = USDC;
        path[1] = WETH_E;

        uint256 deadline = block.timestamp + 15 minutes;

        uint256[] memory amounts = router.swapExactTokensForTokens(
            usdcAmount,
            0, // We don't set a minimum as this is a test, but in production you should
            path,
            address(this),
            deadline
        );

        return amounts[1]; // Amount of WETH.e received
    }

    function test_getExpectedTokens() public view {
        uint256 usdcAmount = 1000 * 1e6; // 1000 USDC
        uint256 expectedWethE = getExpectedTokens(usdcAmount);
        console.log("Expected WETH.e for 1000 USDC:", expectedWethE);
    }

    function test_swapTokens() public {
        uint256 usdcAmount = 1000 * 1e6; // 1000 USDC
        
        // Mint some USDC for testing
        deal(USDC, address(this), usdcAmount);

        uint256 initialWethEBalance = wethE.balanceOf(address(this));
        uint256 receivedWethE = swapTokens(usdcAmount);

        uint256 finalWethEBalance = wethE.balanceOf(address(this));

        assertEq(finalWethEBalance - initialWethEBalance, receivedWethE, "Received WETH.e doesn't match balance change");
        console.log("Received WETH.e for 1000 USDC:", receivedWethE);
    } 
    */
}