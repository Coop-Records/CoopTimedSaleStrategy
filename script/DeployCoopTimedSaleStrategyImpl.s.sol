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
        address defaultOwner = vm.envAddress("DEFAULT_OWNER");
        address zoraRewardRecipient = vm.envAddress("ZORA_REWARD_RECIPIENT");
        address erc20zImpl = vm.envAddress("ERC20Z_IMPL_ADDRESS");
        address protocolRewardsAddress = vm.envAddress("PROTOCOL_REWARDS_ADDRESS");

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
