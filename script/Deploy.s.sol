// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import "forge-std/Script.sol";
import "../src/RockPaperScissors.sol";
import "forge-std/console.sol";

contract Deploy is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);
        RockPaperScissors rockPaperScissors = new RockPaperScissors();
        console.log(address(rockPaperScissors));
        vm.stopBroadcast();
    }
}
