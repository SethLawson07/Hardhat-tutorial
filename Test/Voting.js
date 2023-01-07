const {ethers} = require("hardhat");
const { expect } = require("chai");

describe("Voting contract", function () {
  // ...previous test...

  it("", async function() {
    const [owner, addr1, addr2,addr3] = await ethers.getSigners();

    const Voting = await ethers.getContractFactory("Voting");

    const hardhatVoting = await Voting.deploy();

   
    await hardhatVoting.addCandidate(addr1.address,"Kodjo","David");

    await hardhatVoting.addCandidate(addr2.address,"Ami","Ok");

    

    //let candidates = await hardhatVoting.getCandidates();
    //console.log(candidates);
    

    await hardhatVoting.addVote(addr1.address,addr1.address);
    await hardhatVoting.addVote(addr2.address,addr1.address);
    await hardhatVoting.addVote(addr3.address,addr2.address);

    let winner = await hardhatVoting.getWinner();
    console.log(winner);
    
    //let candidat = await hardhatVoting.getCandidate(addr1.address);
    //console.log(candidat)

  
   

    
  

  });
});