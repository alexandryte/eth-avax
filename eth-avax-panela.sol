// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract errorcontract {
    uint256 public value;

    function setValue(uint256 _newValue) public {
        require(_newValue > value, "New value must be greater than current value");
        value = _newValue;
    }

    function assertExample(uint256 _input) public pure returns (uint256) {
        assert(_input != 2);
        return _input * 2;
    }

    function revertExample(uint256 a, uint256 b) public pure returns (string memory) {
        // Adding a condition (a == b) before reverting
        if (a == b) {
            revert("a must not be equal to b, reverting transaction");
        }

        return "Transaction successful";
    }
}
