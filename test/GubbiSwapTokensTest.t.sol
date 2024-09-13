
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

import "../src/GubbiContract.sol";


    // BTCs have 8 decimals
    // USD stable coins have 6 decimals
    // ETH have 18 decimals

contract GubbiSwapTokensTest is Test {


    IPangolinPair Pair_WABAX_JOE = IPangolinPair(Constants.PAIR_WABAX_JOE);
    ITokenERC20forTesting contratoERC20_WABAX = ITokenERC20forTesting(Constants.WABAX);
    ITokenERC20forTesting contratoERC20_JOE = ITokenERC20forTesting(Constants.JOE);
    
    IPangolinRouter constant router = IPangolinRouter(Constants.PANGOLIN_ROUTER);

    GubbiContract public gubbiInstanceContract;
    address public owner;
    address public user;
    
                                                     

    function setUp() public {
        owner = makeAddr("owner");
        user = makeAddr("user");
        vm.startPrank(owner);
        gubbiInstanceContract = new GubbiContract();
        vm.stopPrank();
    }

    function getIntDec(uint balance, uint decimals) private pure{
        uint integerPart = balance / decimals;
        uint decimalPart = balance % decimals;
        console2.log("Converted cant :",integerPart,'.', decimalPart);
    }

    function test_RegisterUser() public {
         vm.prank(owner);
        gubbiInstanceContract.registerUser(user);
        assertEq(gubbiInstanceContract.GubbiUsers(user), true,'User is registered');
    }

    function test_NotRegisterUser() public view {
        assertEq(gubbiInstanceContract.GubbiUsers(user), false, 'User is not  registered' );
    }

    function testSwapExactTokensForTokens() public {
            vm.prank(owner);
            gubbiInstanceContract.registerUser(user);

            address[] memory path = new address[](2);
            path[0] = Constants.WABAX;
            path[1] = Constants.JOE;
            uint amountIn = 1e18;  
            uint amountOutMin = 1;
            deal(user, 100 * 1e18);
            
            vm.startPrank(user);
            contratoERC20_WABAX.deposit{value: 100 * 1e18}();
            console2.log('en test router address',address(router));
            uint balanceUserBefore= contratoERC20_WABAX.balanceOf(user);
            console2.log('Bal user de WABAX Antes del swap:', balanceUserBefore);
            balanceUserBefore= contratoERC20_JOE.balanceOf(user);
            console2.log('Bal user de JOE Antes del swap:', balanceUserBefore);
            //contratoERC20_WABAX.approve(address(router), type(uint256).max);
            contratoERC20_WABAX.approve(address(gubbiInstanceContract), type(uint256).max);
            console.log('owner address', address(owner));
            console.log('user address', user);

            gubbiInstanceContract.OnRampTrader(
                    path[0],
                    path[1],
                    amountIn,
                    amountOutMin,
                    user
            );        
            vm.stopPrank();
            
            uint balanceUserAfter= contratoERC20_JOE.balanceOf(user);
            console2.log('Balance JOE del user Despues del swap:', balanceUserAfter);
            balanceUserAfter= contratoERC20_WABAX.balanceOf(user);
            console2.log('Balance WABAX del user Despues del swap:', balanceUserAfter);
            assertGe(balanceUserAfter, balanceUserBefore, "User got JOE");
        }



    // function getBalancesonTokens() private view {
    //      console2.log("Geting my Account Balances on Pair");
    //      uint balanceWABAX = contratoERC20_WABAX.balanceOf(Constants.MYACCOUNT);
    //      uint balanceJOE = contratoERC20_JOE.balanceOf(Constants.MYACCOUNT);
    //      console2.log('Balance Wabax:', balanceWABAX);
    //      getIntDec(balanceWABAX,1e18);
    //      console2.log('Balance JOE:', balanceJOE);
    //      getIntDec(balanceJOE,1e18);
    // }

    //     function getBalancesonTestTokens() private view {
    //      console2.log("Geting my Account Balances on Pair");
    //      uint balanceWABAX = contratoERC20_WABAX.balanceOf(user);
    //      uint balanceJOE = contratoERC20_JOE.balanceOf(user);
    //      console2.log('Balance USer: WABAX', balanceWABAX);
    //      getIntDec(balanceWABAX,1e18);
    //      console2.log('Balance User JOE:', balanceJOE);
    //      getIntDec(balanceJOE,1e18);
    // }

    // function test_getAmountsOut() public view {
    //     address[] memory path = new address[](2);
    //     path[0] = Constants.WABAX;
    //     console2.log("getAmountsOut using Path");
    //     path[1] = Constants.JOE;
    //     uint256 amountIn =  80_000_000_000_000_000  ;   
    //     console2.log('Sending token Wabax In:', amountIn);
    //     getIntDec(amountIn, 1e18);
    //     // get output amount using more path of pair
    //     uint[] memory amounts = router.getAmountsOut(amountIn, path);
    //     console2.log("Out", amounts[1]);
    //     getIntDec(amounts[1], 1e18);
    // }

    //     function test_getAmountOut() public view {
    //     console2.log("getAmountOut using Reserves");
    //     // get reserves
    //       (uint112 _reserve0, uint112 _reserve1,)= Pair_WABAX_JOE.getReserves();
    //      console2.log('reserve0', _reserve0);
    //      getIntDec(_reserve0,1e18);
    //      console2.log('reserve1', _reserve1);
    //      getIntDec(_reserve1,1e18);
    //      uint256 amountIn =  4_000_000_000_000_000;   
    //      console2.log('Sending token Wabax In:');
    //      getIntDec(amountIn, 1e18);
    //      uint amountOutput = router.getAmountOut(amountIn, _reserve0, _reserve1);
    //     console2.log('getAmountOUT', amountOutput);
    //      getIntDec(amountOutput, 1e18);
    //     }






}