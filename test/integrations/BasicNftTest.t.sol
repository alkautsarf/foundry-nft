// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Test} from "forge-std/Test.sol";
import {DeployBasicNft} from "../../script/DeployBasicNft.s.sol";
import {BasicNft} from "../../src/BasicNft.sol";

contract BasicNftTest is Test {
    DeployBasicNft public deployer;
    BasicNft public basicNft;
    address public user = makeAddr("user");
    string public constant TESTER =
        "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    function setUp() public {
        deployer = new DeployBasicNft();
        basicNft = deployer.run();
    }

    function testNameIsValid() public {
        string memory expectedName = "CutieCat";
        string memory actualName = basicNft.name();
        assertEq(keccak256(bytes(expectedName)), keccak256(bytes(actualName))); //! For simpler string use this one instead.
            // assertEq(keccak256(abi.encodePacked(expectedName)), keccak256(abi.encodePacked(actualName))); //! For more complex string encoding, such as leading/trailing whitespaces or different character encodings use this method.
    }

    function testSymbolIsValid() public {
        string memory expectedSymbol = "CAT";
        string memory actualSymbol = basicNft.symbol();
        assertEq(keccak256(bytes(expectedSymbol)), keccak256(bytes(actualSymbol))); //! For simpler string use this one instead.
            // assertEq(keccak256(abi.encodePacked(expectedSymbol)), keccak256(abi.encodePacked(actualSymbol))); //! For more complex string encoding, such as leading/trailing whitespaces or different character encodings use this method.
    }

    function testMintAndHaveABalance() public {
        vm.prank(user);
        basicNft.mintNft(TESTER);
        assert(basicNft.balanceOf(user) == 1);
        assert(keccak256(abi.encodePacked(TESTER)) == keccak256(abi.encodePacked(basicNft.tokenURI(0))));
    }
}
