// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleToken {
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public totalSupply;

    mapping(address => uint256) public balanceOf;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Mint(address indexed to, uint256 value);
    event Burn(address indexed from, uint256 value);

    constructor(string memory _name, string memory _symbol, uint8 _decimals, uint256 _initialSupply) {
        name = _name;
        symbol = _symbol;
        decimals = _decimals;
        totalSupply = _initialSupply * 10**uint256(_decimals);
        balanceOf[msg.sender] = totalSupply;
    }

    function transfer(address _to, uint256 _value) external returns (bool success) {
        require(_to != address(0), "Invalid address");
        require(_value <= balanceOf[msg.sender], "Insufficient balance");

        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        emit Transfer(msg.sender, _to, _value);

        return true;
    }

    function mint(address _to, uint256 _value) external {
        require(_to != address(0), "Invalid address");
        require(_value != 0, "Value must be greater than zero"); 

        balanceOf[_to] += _value;
        totalSupply += _value;
        emit Mint(_to, _value);

        // my assert statement
        assert(balanceOf[_to] >= _value); 
    }

    function burn(uint256 _value) external {
        require(_value <= balanceOf[msg.sender], "Insufficient balance");

        balanceOf[msg.sender] -= _value;
        totalSupply -= _value;
        emit Burn(msg.sender, _value);

        if (_value == 42) {
            //my revert with custom message
            revert("Cannot burn 42"); 
        }
    }
}
