//SPDX-License-Identifier: UNLICENSED
import "hardhat/console.sol";

pragma solidity ^0.8.17;

contract Reservation {

    struct Customer {
        address id;
        string firstName;
        string lastName;        
    }

    Customer [] customers;

    struct Room {
        string name;
        uint price;
    }

    Room [] rooms;

    struct Room_reservation {
        address customer;
        uint32 roomId;
        uint32 nbDays;
        uint32 totalPrice;
        uint timestamp;
    }

    Reservation [] reservations;

     // Function to receive Ether. msg.data must be empty
    receive() external payable {}

     // Fallback function is called when msg.data is not empty
    fallback() external payable {}

    function addRoom(string memory _name,uint _price) external {
        rooms.push(Room(_name,_price));
        console.log("True");
    }    

    function addcustomer(address _id,string memory _firstName,string memory _lastName) external {
        customers.push(Customer(_id,_firstName,_lastName));
        console.log("True");

    }

    /*function addReservation(address _customer,uint32 _roomId,uint32 _nbDays) external {
        uint32 memory price;
        for(i=0;i<rooms.length;i++){
            if(rooms[i]==_roomId){
                price=rooms[i].price;
            }
        }
        require(price>0);
        _customer.transfer(price);
        reservations.push(_customer,_roomId,_nbDays,price,block.timestamp);
    }

    function getBalance() external {
        return msg.value;
    }*/

    



}

