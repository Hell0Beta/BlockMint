pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";

import {SayingHi} from "../src/Hello.sol";

contract SayingHiTest is Test {
    SayingHi sayingHi;
    
    function setUp() public{
        sayingHi = new SayingHi();
    }

    function test_greet() public {
        assertEq(sayingHi.greet(), "hi");
    }

}

