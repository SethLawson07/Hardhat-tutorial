// contracts/Box.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// Import Ownable from the OpenZeppelin Contracts library
import "@openzeppelin/contracts/access/Ownable.sol";

// Make Box inherit from the Ownable contract
contract Owner is Ownable {
    uint256 private value;

    event ValueChanged(uint256 value);

    // The onlyOwner modifier restricts who can call the store function
    function store(uint256 _value) public onlyOwner {
        value = _value;
        emit ValueChanged(value);
    }

    function retrieve() public view returns (uint256) {
        return value;
    }
}