const {ethers} = require("hardhat");
const { expect } = require("chai");
const { loadFixture } = require("@nomicfoundation/hardhat-network-helpers");

describe("DataManage contract", function () {

    async function deployDataManageFixture() {
    const [owner, addr1,addr2,addr3] = await ethers.getSigners();
    const data = await ethers.getContractFactory("DataManage");
    //dtm => dataManage Contract
    const dtm = await data.deploy();
    await dtm.deployed();

    return {dtm,owner,addr1,addr2,addr3 }

   
    }


 describe("DataManage", function () {

    it("Add data", async function () {
        const { dtm, owner, addr1, addr2 } = await loadFixture( deployDataManageFixture );
        await dtm.addData(addr1.address,"oklm",26,"B+","M");
        await dtm.updateData(addr1.address,"oklm1",23,"B+","M");
       
    
      
      });

      it("Add access",async function() {
        const { dtm, owner, addr1, addr2, addr3 } = await loadFixture( deployDataManageFixture );
        await dtm.addData(addr1.address,"oklm",26,"B+","M");
        await dtm.addAccess(addr1.address,owner.address);
       // await dtm.removeAccess(addr1.address);
       let data = await dtm.displayData(addr1.address,owner.address);
        console.log(data);
       
      })

    
      it("Display data", async function () {
        const { dtm,addr1,addr3 } = await loadFixture( deployDataManageFixture );
        await dtm.addAccess(addr1.address,addr3.address);
        let data = await dtm.displayData(addr1.address,addr3.address);
        
      });
      
});

describe("Customers Manage", function () {

    it("Add customer", async function () {
        const { dtm, owner, addr1, addr3 } = await loadFixture( deployDataManageFixture );
        await dtm.addCustomer(addr3.address,"oklm","searcher","oklm@gmail.com","000000000");
      });


    
      it("Display customer", async function () {
        const { dtm,addr3 } = await loadFixture( deployDataManageFixture );
       let data = await dtm.displayCustomer(addr3.address);
      // console.log(data);
      });

});

});