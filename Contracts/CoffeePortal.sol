// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

import "hardhat/console.sol";

contract CoffeePortal {

    uint256 totalCoffee;
    address payable public owner;

    event NewCoffee(
        address indexed from,
        uint256 timestamp,
        string message,
        string name
    );


    constructor() payable{
        owner=payable(msg.sender);
    }

    struct Coffee {
        address giver;
        string message;
        string name;
        uint timestamp;
    }

    Coffee [] coffee;

    function getAllCoffee() external view returns(Coffee [] memory){
        return coffee;
    }

    function getTotalCoffee() view external returns (uint256) {
        console.log("We have %d total coffee recieved ", totalCoffee);
        return totalCoffee;
    }

      function buyCoffee(
        string memory _message,
        string memory _name,
        uint256 _payAmount)external payable  {

        uint256 cost = 0.001 ether;
        require(_payAmount <= cost, "Insufficient Ether provided");

        totalCoffee += 1;
        console.log("%s has just sent a coffee!", msg.sender);

        coffee.push(Coffee(msg.sender, _message, _name, block.timestamp));
        owner.transfer(_payAmount);
        

       emit NewCoffee(msg.sender, block.timestamp, _message, _name);
        }

  
}