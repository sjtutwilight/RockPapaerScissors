// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import "forge-std/Test.sol";
import "../src/RockPaperScissors.sol";
import "forge-std/console.sol";

contract RockPaperScissorsTest is Test {
    RockPaperScissors public game;

    function setUp() public {
        game = new RockPaperScissors();
    }

    // function testCreateGame() public {
    //     bytes32 choiceHash = keccak256(
    //         abi.encodePacked(RockPaperScissors.Choice.Rock, "secret")
    //     );

    //     vm.deal(address(this), 5 ether);
    //     vm.prank(address(this));
    //     game.createGame{value: 1 ether}(choiceHash);

    //     (
    //         address banker,
    //         address player,
    //         uint256 stake,
    //         bytes32 bankerChoiceHash,
    //         RockPaperScissors.Choice bankerChoice,
    //         RockPaperScissors.Choice playerChoice,
    //         RockPaperScissors.GameStatus status
    //     ) = game.games(1);

    //     assertEq(banker, address(this));
    //     assertEq(player, address(0));
    //     assertEq(stake, 1 ether);
    //     assertEq(bankerChoiceHash, choiceHash);
    //     assertEq(uint(bankerChoice), uint(RockPaperScissors.Choice.None));
    //     assertEq(uint(playerChoice), uint(RockPaperScissors.Choice.None));
    //     assertEq(uint(status), uint(RockPaperScissors.GameStatus.Created));
    // }

    // function testJoinGame() public {
    //     bytes32 choiceHash = keccak256(
    //         abi.encodePacked(RockPaperScissors.Choice.Rock, "secret")
    //     );

    //     vm.deal(address(this), 1 ether);
    //     vm.prank(address(this));
    //     game.createGame{value: 1 ether}(choiceHash);

    //     vm.deal(address(0x123), 1 ether);
    //     vm.prank(address(0x123));
    //     game.joinGame{value: 1 ether}(1, RockPaperScissors.Choice.Paper);

    //     (
    //         address banker,
    //         address player,
    //         uint256 stake,
    //         bytes32 bankerChoiceHash,
    //         RockPaperScissors.Choice bankerChoice,
    //         RockPaperScissors.Choice playerChoice,
    //         RockPaperScissors.GameStatus status
    //     ) = game.games(1);

    //     assertEq(player, address(0x123));
    //     assertEq(uint(playerChoice), uint(RockPaperScissors.Choice.Paper));
    //     assertEq(uint(status), uint(RockPaperScissors.GameStatus.Joined));
    // }

    // function testRevealChoiceAndFinishGame() public {
    //     bytes32 choiceHash = keccak256(
    //         abi.encodePacked(RockPaperScissors.Choice.Rock, "secret")
    //     );

    //     vm.deal(address(this), 1 ether);
    //     vm.prank(address(this));
    //     game.createGame{value: 1 ether}(choiceHash);

    //     vm.deal(address(0x123), 1 ether);
    //     vm.prank(address(0x123));
    //     game.joinGame{value: 1 ether}(1, RockPaperScissors.Choice.Scissors);
    //     vm.prank(address(this));

    //     game.revealChoice(1, RockPaperScissors.Choice.Rock, "secret");

    //     (
    //         address banker,
    //         address player,
    //         uint256 stake,
    //         bytes32 bankerChoiceHash,
    //         RockPaperScissors.Choice bankerChoice,
    //         RockPaperScissors.Choice playerChoice,
    //         RockPaperScissors.GameStatus status
    //     ) = game.games(1);

    //     assertEq(uint(bankerChoice), uint(RockPaperScissors.Choice.Rock));
    //     assertEq(uint(playerChoice), uint(RockPaperScissors.Choice.Scissors));
    //     assertEq(uint(status), uint(RockPaperScissors.GameStatus.Finished));

    //     // Checking balances to ensure the winner is correctly rewarded
    //     assertEq(address(this).balance, 2 ether);
    //     assertEq(address(0x123).balance, 0 ether);
    // }
    // fallback() external payable {}
}
