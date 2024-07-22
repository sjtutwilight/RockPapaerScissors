// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import "forge-std/Script.sol";
import "../src/RockPaperScissors.sol";
import "forge-std/console.sol";

contract Deploy is Script {
    function run() external {
        console.log(vm.envString("NETWORK"));

        uint256 deployerPrivateKey;
        string memory network = vm.envString("NETWORK");

        if (
            keccak256(abi.encodePacked(network)) ==
            keccak256(abi.encodePacked("sepolia"))
        ) {
            deployerPrivateKey = vm.envUint("SEPOLIA_PRIVATE_KEY");
        } else {
            deployerPrivateKey = vm.envUint("LOCAL_PRIVATE_KEY");
        }

        vm.startBroadcast(deployerPrivateKey);
        RockPaperScissors rockPaperScissors = new RockPaperScissors();
        console.log(address(rockPaperScissors));
        vm.stopBroadcast();
    }
}
