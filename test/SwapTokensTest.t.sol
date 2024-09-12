
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


    // BTCs have 8 decimals
    // USD stable coins have 6 decimals
    // ETH have 18 decimals

contract SwapTokensTest is Test {


    IPangolinPair Pair_WABAX_JOE = IPangolinPair(Constants.PAIR_WABAX_JOE);
    ITokenERC20forTesting contratoERC20_WABAX = ITokenERC20forTesting(Constants.WABAX);
    ITokenERC20forTesting contratoERC20_JOE = ITokenERC20forTesting(Constants.JOE);
    
    IPangolinRouter private constant router = IPangolinRouter(Constants.PANGOLIN_ROUTER);
    address private constant user = address(100);
    
                                                     

    function setUp() public {
            deal(user, 100 * 1e18);
            vm.startPrank(user);
            contratoERC20_WABAX.deposit{value: 100 * 1e18}();
            contratoERC20_WABAX.approve(address(router), type(uint256).max);
            vm.stopPrank();
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
         uint balanceJOE = contratoERC20_JOE.balanceOf(Constants.MYACCOUNT);
         console2.log('Balance Wabax:', balanceWABAX);
         getIntDec(balanceWABAX,1e18);
         console2.log('Balance JOE:', balanceJOE);
         getIntDec(balanceJOE,1e18);
    }

        function getBalancesonTestTokens() private view {
         console2.log("Geting my Account Balances on Pair");
         uint balanceWABAX = contratoERC20_WABAX.balanceOf(user);
         uint balanceJOE = contratoERC20_JOE.balanceOf(user);
         console2.log('Balance USer: WABAX', balanceWABAX);
         getIntDec(balanceWABAX,1e18);
         console2.log('Balance User JOE:', balanceJOE);
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
         uint256 amountIn =  4_000_000_000_000_000;   
         console2.log('Sending token Wabax In:');
         getIntDec(amountIn, 1e18);
         uint amountOutput = router.getAmountOut(amountIn, _reserve0, _reserve1);
        console2.log('getAmountOUT', amountOutput);
         getIntDec(amountOutput, 1e18);
        }




        function testSwapExactTokensForTokens() public {
            console2.log('Sawaping WABAX / JOE');
            console2.log('Antes del swap');
            getBalancesonTestTokens();
            address[] memory path = new address[](2);
            path[0] = Constants.WABAX;
            path[1] = Constants.JOE;
            uint amountIn = 1e18;  
            uint amountOutMin = 1;
            console2.log('Trading In:', amountIn);
            getIntDec(amountIn, 1e18);
            uint[] memory amountsExchanged = new uint[](4);
            vm.prank(user);
            amountsExchanged = router.swapExactTokensForTokens(
                    amountIn,
                    amountOutMin,
                    path,
                    user,
                    block.timestamp);            
            console2.log('Despues del swap');
            getBalancesonTestTokens();
            assertGe(contratoERC20_JOE.balanceOf(user), amountOutMin, "JOE balance of user");
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