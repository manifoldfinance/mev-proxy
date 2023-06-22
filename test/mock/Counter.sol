pragma solidity 0.8.19;

contract SimpleStore {
    string _value;

    constructor() {
        _value = "InitialValue";
    }

    function set(string calldata value) public {
        _value = value;
    }

    function get() public view returns (string memory) {
        return _value;
    }

}
