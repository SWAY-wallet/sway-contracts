// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import { SwayDiamondBase } from "./base/SwayDiamondBase.sol";
import { ISwayWalletDiamond } from "../interfaces/ISwayWalletDiamond.sol";

contract SwayWalletDiamond is ISwayWalletDiamond, SwayDiamondBase {
    constructor(address owner_) public {
        _init(owner_);
    }
    /**
     * @notice return the current version of the diamond
     */
    function version()
        public
        pure
        override(ISwayWalletDiamond)
        returns (string memory)
    {
        return "1.0.0";
    }
}
