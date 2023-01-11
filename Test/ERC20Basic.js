const {ethers} = require("hardhat");
const { expect } = require("chai");

describe("ERC20Basic contract", function () {
  // ...previous test...

  it("", async function() {
    const [owner, addr1, addr2, addr3] = await ethers.getSigners();

    const ERC20Basic = await ethers.getContractFactory("ERC20Basic");

    const hardhatERC20Basic = await ERC20Basic.deploy();


    

    await hardhatERC20Basic.transfer(addr1.address,100);

    let balance = await hardhatERC20Basic.balanceOf(addr1.address); 
    console.log(balance);
    

    await hardhatERC20Basic.approve(addr2.address,3)

    let balanceOwner = await hardhatERC20Basic.balanceOf(owner.address);
    console.log(balanceOwner);

    let result = await hardhatERC20Basic.allowance(owner.address,addr2.address);
    console.log(result);

   // let result1 = await hardhatERC20Basic.transferFrom(owner.address,addr3.address,3);
    //console.log(result1);
    

   
  });
});