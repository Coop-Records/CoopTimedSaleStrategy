// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "forge-std/Script.sol";
import {CoopTimedSaleStrategyImpl} from "../src/CoopTimedSaleStrategyImpl.sol";
import {IProtocolRewards} from "@zoralabs/protocol-rewards/src/interfaces/IProtocolRewards.sol";

contract DeployCoopTimedSaleStrategyImpl is Script {
    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address defaultOwner = vm.envAddress("DEFAULT_OWNER");
        address zoraRewardRecipient = vm.envAddress("ZORA_REWARD_RECIPIENT");
        address erc20zImpl = vm.envAddress("ERC20Z_IMPL_ADDRESS");
        address protocolRewardsAddress = vm.envAddress(
            "PROTOCOL_REWARDS_ADDRESS"
        );

        vm.startBroadcast(deployerPrivateKey);

        CoopTimedSaleStrategyImpl impl = new CoopTimedSaleStrategyImpl();

        // impl.initialize(
        //     defaultOwner,
        //     zoraRewardRecipient,
        //     erc20zImpl,
        //     IProtocolRewards(protocolRewardsAddress)
        // );

        console.log("CoopTimedSaleStrategyImpl deployed at:", address(impl));

        vm.stopBroadcast();
    }
}
