// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "forge-std/Script.sol";
import {CoopTimedSaleStrategyImpl} from "../src/CoopTimedSaleStrategyImpl.sol";
import {CoopTimedSaleStrategy} from "../src/CoopTimedSaleStrategy.sol";
import {IProtocolRewards} from "@zoralabs/protocol-rewards/src/interfaces/IProtocolRewards.sol";
import {TransparentUpgradeableProxy} from "@openzeppelin/contracts/proxy/transparent/TransparentUpgradeableProxy.sol";
import {ProxyAdmin} from "@openzeppelin/contracts/proxy/transparent/ProxyAdmin.sol";

contract DeployCoopTimedSaleStrategyImpl is Script {
    function run() public {
        address defaultOwner = 0x9266F125fb2EcB730D9953b46dE9C32e2Fa83E4a;
        address zoraRewardRecipient = 0x9266F125fb2EcB730D9953b46dE9C32e2Fa83E4a;
        address erc20zImpl = 0x6E742921602a5195f6439c8b8b827E85902E1B2D;
        address protocolRewardsAddress = 0x7777777F279eba3d3Ad8F4E708545291A6fDBA8B;

        vm.startBroadcast();

        // Deploy implementation
        CoopTimedSaleStrategyImpl impl = new CoopTimedSaleStrategyImpl();

        // Deploy ProxyAdmin
        CoopTimedSaleStrategy proxyAdmin = new CoopTimedSaleStrategy(address(impl));

        // Initialize the Minter Proxy
        CoopTimedSaleStrategyImpl(address(proxyAdmin)).initialize(
            defaultOwner, zoraRewardRecipient, erc20zImpl, IProtocolRewards(protocolRewardsAddress)
        );

        console.log("CoopTimedSaleStrategyImpl proxy deployed at:", address(proxyAdmin));

        vm.stopBroadcast();
    }
}
