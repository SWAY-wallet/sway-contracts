// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import { SolidStateDiamond } from "@solidstate/contracts/proxy/diamond/SolidStateDiamond.sol";
import { IWalletFactoryDiamond } from "../interfaces/IWalletFactoryDiamond.sol";

contract WalletFactoryDiamond is IWalletFactoryDiamond, SolidStateDiamond {
    /**
     * @notice return the current version of the diamond
     */
    function version() public pure override returns (string memory) {
        return "1.0.0";
    }
}
