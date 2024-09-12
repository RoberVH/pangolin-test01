// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "@pangolin/pangolin-periphery/interfaces/IPangolinRouter.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract PangolinTests is Test {

    

    // Direcciones en Avalanche Fuji Testnet
    address constant PANGOLIN_FACTORY = 0x2a496ec9e9bE22e66C61d4Eb9d316beaEE31A77b;
    address constant PANGOLIN_ROUTER = 0x2D99ABD9008Dc933ff5c0CD271B88309593aB921;
    


    address constant FACTORY =  0x2a496ec9e9bE22e66C61d4Eb9d316beaEE31A77b;
    address constant WETH_E = 0x9668f5f55f2712Dd2dfa316256609b516292D554;
    address constant WETH = 0x5085f96Fab5A4F4cD6AceDf8054b431AaCf298f9;
    address constant USDC = 0x5425890298aed601595a70AB815c96711a31Bc65;
    address constant USDT = 0xd8b917cf32022e35E09Bac2c6F16a64fa7D1DEC9;
    address constant TUSD = 0xd00B9BBC6EDC3953Ec502d73E7FA7C59f628d947;     // (True USD TUSD)
    
    
    //address constant USDC =    0x204eEf60d7158653013158Bc1283860124249805
    //address constant USDC = 0x92894336594fcE562A0003E129c2F51eB17Dc885;
    
    
    IPangolinRouter router;
    IERC20 wethE;
    IERC20 weth;
    IERC20 usdc;
    IERC20 usdt;

    function setUp() public {
        router = IPangolinRouter(PANGOLIN_ROUTER);
        wethE = IERC20(WETH_E);
        weth = IERC20(WETH);
        usdc = IERC20(USDC);
        usdc = IERC20(USDT);
    }

    function getExpectedTokens(uint256 usdcAmount) public view returns (uint256) {
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
}