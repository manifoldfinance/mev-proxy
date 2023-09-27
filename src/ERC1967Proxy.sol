/// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Proxy} from "./Proxy.sol";
import {ERC1967Utils} from "./ERC1967Utils.sol";

/// @title ERC1967Proxy
/// @author OpenZeppelin
/// @custom:source OpenZeppelin Contracts (last updated v4.7.0) (proxy/ERC1967/ERC1967Proxy.sol)

/**
 * [!NOTE]
 * @dev This contract implements an upgradeable proxy. It is upgradeable because calls are delegated to an
 *     implementation address that can be changed. 
 *    
 *    [!EIP1967]
 *    This address is stored in storage in the location specified by:
 *     <https://eips.ethereum.org/EIPS/eip-1967> 
 *     so that it doesn't conflict with the storage layout of the implementation behind the proxy.
 *
 */

contract ERC1967Proxy is Proxy {
    /**
     * @dev Initializes the upgradeable proxy with an initial implementation specified by `_logic`.
     *
     * If `_data` is nonempty, it's used as data in a delegate call to `_logic`. This will typically be an encoded
     * function call, and allows initializing the storage of the proxy like a Solidity constructor.
     *
     * @custom:requirements
     *
     * - If `data` is empty, `msg.value` must be zero.
     */
    constructor(address _logic, bytes memory _data) payable {
        ERC1967Utils.upgradeToAndCall(_logic, _data);
    }

    /**
     * @dev Returns the current implementation address.
     *
     * TIP: To get this value clients can read directly from the storage slot shown below (specified by EIP1967) using the
     * https://eth.wiki/json-rpc/API#eth_getstorageat[`eth_getStorageAt`] RPC call.
     * `0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc`
     */
    function _implementation() internal view virtual override returns (address impl) {
        return ERC1967Utils.getImplementation();
    }
}
