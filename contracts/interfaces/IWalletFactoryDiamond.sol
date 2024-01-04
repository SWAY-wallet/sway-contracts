//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

/**
 * @title WalletFactoryDiamond interface
 */
interface IWalletFactoryDiamond {
    function version() external view returns (string memory);
}
