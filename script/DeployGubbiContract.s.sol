// SPDX-License-Identifier: MIT
/**
 * @title DeployGubbiContract.s.sol
 * @author Roberto V. (rovicher.eth)
 * @notice Comando to deploy contract GubbiContract:
 *              forge script script/DeployGubbiContract.s.sol:DeployGubbiContract --rpc-url $RPC_TEST --private-key $PVTE_KEY --broadcast
 *              Environment Vars have to be set up prior to run it
 */

pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/GubbiContract.sol";

contract DeployGubbiContract is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PVTE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        GubbiContract gubbiContract = new GubbiContract();
        vm.stopBroadcast();
        console.log("GubbiContract deployed at:", address(gubbiContract));
    }
}
