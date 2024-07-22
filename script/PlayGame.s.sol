// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/RockPaperScissors.sol";

contract PlayGame is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("SEPOLIA_PRIVATE_KEY");
        uint256 playerPrivateKey = vm.envUint("PLAYER_PRIVATE_KEY");

        // Connect as deployer (banker)
        vm.startBroadcast(deployerPrivateKey);
        RockPaperScissors rockPaperScissors = RockPaperScissors(
            vm.envAddress("ROCK_PAPER_SCISSORS_ADDRESS")
        );

        bytes32 bankerChoiceHash = keccak256(
            abi.encodePacked(uint8(RockPaperScissors.Choice.Rock), "secret")
        );
        rockPaperScissors.createGame{value: 0.01 ether}(bankerChoiceHash);
        console.log("Game created by banker");

        vm.stopBroadcast();

        // Connect as player
        vm.startBroadcast(playerPrivateKey);
        rockPaperScissors.joinGame{value: 0.01 ether}(
            2,
            RockPaperScissors.Choice.Scissors
        );
        console.log("Game joined by player");

        // Connect as deployer to reveal choice
        vm.stopBroadcast();
        vm.startBroadcast(deployerPrivateKey);
        rockPaperScissors.revealChoice(
            2,
            RockPaperScissors.Choice.Rock,
            "secret"
        );
        console.log("Choice revealed by banker");

        // Withdraw funds if necessary
        rockPaperScissors.withdrawFunds(2);
        // console.log("Funds withdrawn");
        vm.stopBroadcast();
    }
}
