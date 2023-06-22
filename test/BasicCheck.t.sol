pragma solidity 0.8.19;

import "src/TransparentUpgradeableProxy.sol";
import "./mock/Counter.sol";
import "forge-std/Test.sol";

contract TestBasicProxy is Test {
    TransparentUpgradeableProxy proxy;
    SimpleStore store;

    // Code is audited by OZ, this ensures that code will function properly though regardless
    function setUp() public {
        store = new SimpleStore();
        proxy = new TransparentUpgradeableProxy(address(store), address(0x06), "");
    }

    function testProxy() public {
        SimpleStore(address(proxy)).set("RandomStringOfLogic");
        assertEq(SimpleStore(address(proxy)).get(), "RandomStringOfLogic");

        SimpleStore(address(proxy)).set("AnotherRandomStringOfLogic");
        assertEq(SimpleStore(address(proxy)).get(), "AnotherRandomStringOfLogic");

        assertEq(store.get(), "InitialValue");
    }
}