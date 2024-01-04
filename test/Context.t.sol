// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import { IOwnable } from "@solidstate/contracts/access/ownable/Ownable.sol";
import { ISafeOwnable } from "@solidstate/contracts/access/ownable/SafeOwnable.sol";
import { IERC165 } from "@solidstate/contracts/interfaces/IERC165.sol";
import { IERC173 } from "@solidstate/contracts/interfaces/IERC173.sol";
import { IDiamondFallback } from "@solidstate/contracts/proxy/diamond/fallback/IDiamondFallback.sol";
import { IDiamondReadable } from "@solidstate/contracts/proxy/diamond/readable/IDiamondReadable.sol";
import { IDiamondWritable } from "@solidstate/contracts/proxy/diamond/writable/IDiamondWritable.sol";
import { SolidStateERC721Mock } from "@solidstate/contracts/token/ERC721/SolidStateERC721Mock.sol";

import { SwayWalletDiamond } from "@sway-wallet/diamond/SwayWalletDiamond.sol";
import { WalletFactoryDiamond } from "@sway-wallet/diamond/WalletFactoryDiamond.sol";
import { TestUtils } from "test/utils/TestUtils.t.sol";

abstract contract ContextTest is TestUtils {
    SwayWalletDiamond public swayWalletDiamond;
    WalletFactoryDiamond public walletFactoryDiamond;
    SolidStateERC721Mock public erc721;
    SolidStateERC721Mock public erc721_2;

    function _initSwayDiamond(address user) internal {
        vm.assume(user != ZERO_ADDRESS);
        vm.assume(user != DEPLOYER);
        vm.prank(DEPLOYER);
        swayWalletDiamond = new swayWalletDiamond(user);
        walletFactoryDiamond = new WalletFactoryDiamond();
        vm.stopPrank();
    }

    function _initERC721Mock() internal {
        erc721 = new SolidStateERC721Mock("test", "TEST", "");
        erc721_2 = new SolidStateERC721Mock("test2", "TEST2", "");
    }

    function _facetFunctionSelectors(bytes4[] memory selectors) internal {
        assertEq(selectors.length, 12);

        // registered DiamondFallback
        assertEq(selectors[0], IDiamondFallback.getFallbackAddress.selector);

        assertEq(selectors[1], IDiamondFallback.setFallbackAddress.selector);

        // registered DiamondWritable
        assertEq(selectors[2], IDiamondWritable.diamondCut.selector);

        // registered DiamondReadable
        assertEq(selectors[3], IDiamondReadable.facets.selector);
        assertEq(
            selectors[4],
            IDiamondReadable.facetFunctionSelectors.selector
        );
        assertEq(selectors[5], IDiamondReadable.facetAddresses.selector);
        assertEq(selectors[6], IDiamondReadable.facetAddress.selector);

        // registered ERC165
        assertEq(selectors[7], IERC165.supportsInterface.selector);

        // registered SafeOwnable
        assertEq(selectors[8], IERC173.owner.selector);
        assertEq(selectors[9], ISafeOwnable.nomineeOwner.selector);
        assertEq(selectors[10], IERC173.transferOwnership.selector);
        assertEq(selectors[11], ISafeOwnable.acceptOwnership.selector);
    }
}
