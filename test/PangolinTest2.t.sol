
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "forge-std/console2.sol";
import "@pangolin/pangolin-periphery/interfaces/IPangolinRouter.sol";
import "@pangolin/pangolin-core/interfaces/IPangolinPair.sol";
import "@pangolin/pangolin-core/interfaces/IPangolinFactory.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";


    // BTCs have 8 decimals
    // USD stable coins have 6 decimals
    // ETH have 18 decimals

contract PangolinTests is Test {


    address constant MYACCOUNT = 0x95c694C18ef33bC9280a948E1c14F5bA07e62B83;

    //***********************************************************************************************
    // Avalanche Fuji Testnet ERC20 & other contract address 
    address constant PANGOLIN_ROUTER = 0x2D99ABD9008Dc933ff5c0CD271B88309593aB921;
    address constant PANGOLIN_FACTORY = 0xE4A575550C2b460d2307b82dCd7aFe84AD1484dd;

        address constant DAI_E = 0x51290cb93bE5062A6497f16D9cd3376Adf54F920;        // 6 decimals
    address constant USDC = 0x5425890298aed601595a70AB815c96711a31Bc65;         // 6 decimals
    address constant WETH = 0x5085f96Fab5A4F4cD6AceDf8054b431AaCf298f9;         // 18 decimals
    address constant EURO_E = 0xA089a21902914C3f3325dBE2334E9B466071E5f1;        // 6 Decimals
    address constant ALOT = 0x9983F755Bbd60d1886CbfE103c98C272AA0F03d6;         // 18 decimals
    address constant JOE = 0xEa81F6972aDf76765Fd1435E119Acc0Aafc80BeA;   // 18 dec
    address constant WABAX = 0xd00ae08403B9bbb9124bB305C09058E32C39A48c;    // 18 dec
    address constant UNI = 0xf4E0A9224e8827dE91050b528F34e2F99C82Fbf6; // Uniswap 18 dec
    IPangolinPair Pair_WABAX_JOE = IPangolinPair(0x295Bfc4A2344642F44f66395AdF0c29939f3faeA);


    IERC20 contratoERC20_WABAX = IERC20(WABAX);
    IERC20 contratoERC20_JOE = IERC20(JOE);


    

    //***********************************************************************************************


    //**********************************************************************************************
    // MainNet ERC20 & other contract address       
     //address constant PANGOLIN_FACTORY=0xefa94DE7a4656D787667C749f7E1223D71E9FD88;
    // address constant PAIR_USDC_DAI_E = 0x86129F99A312602c9b4817EF91d3b336a5d0477F;
    //  address constant DAI_E = 0xd586E7F844cEa2F87f50152665BCbc2C279D8d70;
    //  address constant USDC =   0xB97EF9Ef8734C71904D8002F8b6Bc66Dd9c48a6E;

     IPangolinRouter private constant router = IPangolinRouter(PANGOLIN_ROUTER);
   //  IPangolinPair private constant pair_usdc_dai = IPangolinPair(PANGOLIN_PAIR_USDC_DAI_E);

//    address constant PANGOLIN_ROUTER = 0xE54Ca86531e17Ef3616d22Ca28b0D458b6C89106;
//    address constant PANGOLIN_PAIR_USDC_DAI_E = 0x86129F99A312602c9b4817EF91d3b336a5d0477F;
    //**********************************************************************************************
                                                

    function setUp() public {
    }

 function test_getAmountsOut()  public view {

         // balance de Wabax en mi cuenta
         uint balanceWabax = contratoERC20_WABAX.balanceOf(MYACCOUNT);
         uint balanceJoe = contratoERC20_WABAX.balanceOf(MYACCOUNT);
         console2.log('Balance Wabax:', balanceWabax);
          uint256 integerPart = balanceWabax / 1e18;
        
        // Parte decimal del balance
        uint256 decimalPart = balanceWabax % 1e18;
        
        console2.log("Balance entero:", integerPart);
        console2.log("Decimales:", decimalPart);

        address[] memory path = new address[](2);
         path[0] = WABAX;
         //path[1] = UNI;
         path[1] = JOE;
         
        // get reserves
          (uint112 _reserve0, uint112 _reserve1,)= Pair_PNG_JOE.getReserves();
         console2.log('reserva0', _reserve0);
         console2.log('reserva1', _reserve1);
        
        //uint256 amountIn = 10*1e18 ;   // 
        uint256 amountIn =  80_000_000_000_000_000  ;   
                                          
         
          
          // get output amounst using more than one pair
          uint[] memory amounts = router.getAmountsOut(amountIn, path);
         console2.log("getAmounstsOut using Path");
         console2.log("In", amounts[0]);
         console2.log("Out", amounts[1]);

        uint256 amountOutMin =  amounts[1] -  10000000000000000;   
         console2.log("Monto minimo a recibir", amountOutMin );

        // get output amount using only two pairs
         console2.log("getAmountOut using only two pairs");
         uint amountOutput = router.getAmountOut(amountIn, _reserve0, _reserve1);
         console2.log('getAmountOUT', amountOutput);

        //  La reciproca: 
        //  path[0] = UNI;
        //  path[1] = WABAX;
        //  amountIn = 747614975656816785;

        //  amountOutput = router.getAmountOut(amountIn, _reserve0, _reserve1);
        //  console2.log('Reciproca', amountOutput);

         // realiza el intercambio

        //     uint256 currentTime = block.timestamp;

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