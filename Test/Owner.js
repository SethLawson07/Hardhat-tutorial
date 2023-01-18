const {ethers} = require("hardhat");
const { expect } = require("chai");

describe("Owner contract", function () {


  it("", async function() {
    const [owner, addr1, addr2] = await ethers.getSigners();
    const Owner = await ethers.getContractFactory("Owner");
    const hreOwner = await Owner.deploy();

    await hreOwner.store(12);

    let value = await hreOwner.retrieve();
    console.log(value);

    
  });
});