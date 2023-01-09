const {ethers} = require("hardhat");
const { expect } = require("chai");

describe("Reservation contract", function () {
  // ...previous test...

  it("", async function() {
    const [owner, addr1, addr2] = await ethers.getSigners();

    const Reservation = await ethers.getContractFactory("Reservation");

    const hardhatReservation = await Reservation.deploy();


    await hardhatReservation.addRoom("CH7",5);

    await hardhatReservation.addcustomer(addr1.address,"John","Doe");
    

   
  });
});