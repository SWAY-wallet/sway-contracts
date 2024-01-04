// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

interface IErrors {
    error ZeroAddress(string description);
    error ZeroUint(string description);
    error ZeroArray(string description);
    error Overflow(string description);
    error ArrayIndexOutOfBounds(string description);
}
