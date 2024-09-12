// SPDX-License-Identifier: MIT
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
    IPangolinPair T_Pair_PNG_JOE = IPangolinPair(0x295Bfc4A2344642F44f66395AdF0c29939f3faeA);
    IPangolinPair T_Pair_WABAX_JOE = IPangolinPair(0x295Bfc4A2344642F44f66395AdF0c29939f3faeA);
    }
    //address constant PANGOLIN_FACTORY = 0xE4A575550C2b460d2307b82dCd7aFe84AD1484dd;
                                        
    // testnet
    // address constant PANGOLIN_ROUTER = 0x2D99ABD9008Dc933ff5c0CD271B88309593aB921;

    
    // FUJI TestNet ERC20 & other contract address
    // verificados

    address constant T_PANGOLIN_ROUTER = 0x2D99ABD9008Dc933ff5c0CD271B88309593aB921;
    address constant T_PANGOLIN_FACTORY = 0xE4A575550C2b460d2307b82dCd7aFe84AD1484dd;

        address constant DAI_E = 0x51290cb93bE5062A6497f16D9cd3376Adf54F920;        // 6 decimals
    address constant USDC = 0x5425890298aed601595a70AB815c96711a31Bc65;         // 6 decimals
    address constant WETH = 0x5085f96Fab5A4F4cD6AceDf8054b431AaCf298f9;         // 18 decimals
    address constant EURO_E = 0xA089a21902914C3f3325dBE2334E9B466071E5f1;        // 6 Decimals
    address constant ALOT = 0x9983F755Bbd60d1886CbfE103c98C272AA0F03d6;         // 18 decimals
    address constant PNG = 0xd00ae08403B9bbb9124bB305C09058E32C39A48c;   // 18 dec
    address constant JOE = 0xEa81F6972aDf76765Fd1435E119Acc0Aafc80BeA;   // 18 dec
    address constant WABAX = 0xd00ae08403B9bbb9124bB305C09058E32C39A48c;    // 18 dec
    address constant UNI = 0xf4E0A9224e8827dE91050b528F34e2F99C82Fbf6; // Uniswap 18 dec



    IERC20 contratoERC20_WABAX = IERC20(0xd00ae08403B9bbb9124bB305C09058E32C39A48c);
     // address constant DAI_E = 0x51290cb93bE5062A6497f16D9cd3376Adf54F920;
    // address constant USDC_E = 0x57F1c63497AEe0bE305B8852b354CEc793da43bB;    // Bridge USDC from ethereum
    // address constant WETH_E = 0x9668f5f55f2712Dd2dfa316256609b516292D554;
    // address constant WBTC_E = 0x3Bd8e00c25B12E6E60fc8B6f1E1E2236102073Ca;    // wrapped  WBTC.e
    // address constant WETH = 0x5085f96Fab5A4F4cD6AceDf8054b431AaCf298f9;
     // address constant USDC = 0x5425890298aed601595a70AB815c96711a31Bc65; // tengo saldo en NVA_CTA



    

    
    // address constant USDT_E = 0x70460c3Bb9Ab95dB6E18fA6E6049a682feB92cd0;      // Bridge USDT from ethereum
    // address constant BUSD_E =            // bridge Binance USD  from Etehreum

    // address constant USDT =   0xd8b917cf32022e35E09Bac2c6F16a64fa7D1DEC9;
    // address constant USDT =   0x7A5e6d4228B7C60FE116A12E7AF65Bbf8D94C945; 

    // address constant TUSD = 0xd00B9BBC6EDC3953Ec502d73E7FA7C59f628d947;      // (True USD TUSD)
    



 //  **********************************************************************************************
 //   MainNet ERC20 & other contract address      //*
 //  **********************************************************************************************
    address constant PANGOLIN_FACTORY_P = 0xefa94DE7a4656D787667C749f7E1223D71E9FD88;
    address constant PANGOLIN_ROUTER_P = 0xE54Ca86531e17Ef3616d22Ca28b0D458b6C89106;
    
    address constant PAIR_USDC_DAI_E_T = 0x86129F99A312602c9b4817EF91d3b336a5d0477F;
     address constant DAI_E_T = 0xd586E7F844cEa2F87f50152665BCbc2C279D8d70;
     address constant USDC_T =   0xB97EF9Ef8734C71904D8002F8b6Bc66Dd9c48a6E;


    // address constant USDT =   0x9702230A8Ea53601f5cD2dc00fDBc13d4dF4A8c7;
    // address constant USDC_E = 0xA7D7079b0FEaD91F3e65f86E8915Cb59c1a4C664;      // Bridge USDC from ethereum
    // address constant USDT_E = 0xc7198437980c041c805A1EDcbA50c1Ce5db95118;      // Bridge USDT from ethereum
    // address constant WBTC_E = 0x50b7545627a5162F82A992c33b87aDc75187B218;       // wrapped  WBTC.e
    // address constant BTC_B =  0x152b9d0FdC40C096757F570A51E494bd4b943E50;        // // Bridge Bitcoin BTC.b
    // address constant WETH_E = 0x49D5c2BdFfac6CE2BFdB6640F4F80f226bc10bAB;       // WETH.e
    // address constant WETH = 0x29B1B2d083456FD07b19649F8B85f9927A29B1Ab;
    // address constant renBTC  = 0xDBf31dF14B66535aF65AaC99C32e9eA844e14501;   // wrapped  ren WBTC
    // address constant BUSD_E =  0x19860CCB0A68fd4213aB9D8266F7bBf05A8dDe98;         // bridge Binance USD  from Etehreum    
