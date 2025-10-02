// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {BUY} from "../src/BUYtkn.sol";

contract BUYtknTest is Test {
    BUY buy;
    address alice = address(0x1);
    address bob = address(0x2);

    function setUp() public {
        buy = new BUY();
        // Give Alice some tokens if needed
        vm.prank(address(this));
        buy.transfer(alice, 1000 ether);
    }

    function testName() public {
        assertEq(buy.name(), "BUY");
    }

    function testSymbol() public {
        assertEq(buy.symbol(), "BUY");
    }

    function testDecimals() public {
        assertEq(buy.decimals(), 18);
    }

    function testTotalSupply() public {
        uint256 supply = buy.totalSupply();
        assertGt(supply, 0);
    }

    function testBalanceOfAlice() public {
        assertEq(buy.balanceOf(alice), 1000 ether);
    }

    function testTransfer() public {
        vm.prank(alice);
        bool success = buy.transfer(bob, 100 ether);
        assertTrue(success);
        assertEq(buy.balanceOf(bob), 100 ether);
        assertEq(buy.balanceOf(alice), 900 ether);
    }

    function testApproveAndAllowance() public {
        vm.prank(alice);
        bool success = buy.approve(bob, 500 ether);
        assertTrue(success);
        assertEq(buy.allowance(alice, bob), 500 ether);
    }

    function testTransferFrom() public {
        vm.prank(alice);
        buy.approve(bob, 200 ether);

        vm.prank(bob);
        bool success = buy.transferFrom(alice, bob, 150 ether);
        assertTrue(success);
        assertEq(buy.balanceOf(bob), 150 ether);
        assertEq(buy.balanceOf(alice), 850 ether);
        assertEq(buy.allowance(alice, bob), 50 ether);
    }

    function testTransferInsufficientBalance() public {
        vm.prank(bob);
        vm.expectRevert();
        buy.transfer(alice, 1 ether);
    }

    function testTransferFromInsufficientAllowance() public {
        vm.prank(alice);
        buy.approve(bob, 10 ether);

        vm.prank(bob);
        vm.expectRevert();
        buy.transferFrom(alice, bob, 20 ether);
    }
}