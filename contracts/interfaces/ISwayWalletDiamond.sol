//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

/**
 * @title SwayWalletDiamond interface
 */
interface ISwayWalletDiamond {
    function version() external view returns (string memory);
}
