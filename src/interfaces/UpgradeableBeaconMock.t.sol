/// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @custom:test UpgradeableBeaconMock

import {IBeacon} from "./IBeacon.sol";

/// @title UpgradeableBeaconMock

contract UpgradeableBeaconMock is IBeacon {
    address public implementation;

    constructor(address impl) {
        implementation = impl;
    }
}
