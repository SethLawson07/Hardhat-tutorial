//SPDX-License-Identifier: UNLICENSED
import "hardhat/console.sol";

// Solidity files have to start with this pragma.
// It will be used by the Solidity compiler to validate its version.
pragma solidity ^0.8.17;

contract Voting {

    struct Candidate {
        address id;
        string lastName;
        string firstName;
        uint totalVote;
    }

    Candidate [] candidates;
    
    address [] voters;
    event Notify(address _address,address _to);

    // Function to add candidates all data in the mapping
    function addCandidate(address _address, string memory _lastName, string memory _firstName) external {
        candidates.push(Candidate(_address,_lastName,_firstName,0));
        console.log("Successfully registered candidate : %s %s %s ",_address,_firstName,_lastName);
    }

    // Function to return all data in the mapping
    function getCandidates() external view returns(Candidate [] memory) {
        return candidates;

    }

    // Function to return a data in the mapping
    function getCandidate(address _address) external view returns (Candidate memory){
        bool exist=false;
        for(uint i=0;i<candidates.length;i++){
           if(candidates[i].id==_address){
            exist=true;
            require(exist);
            return  candidates[i];
           } 
    }}

    // Function to add vote
    function addVote(address _address,address _to) external {
        bool exist=false;
        for(uint i=0;i<candidates.length;i++){
            if (candidates[i].id==_to){
               candidates[i].totalVote++;
                exist=true;

            }  
            
        }
        require(exist==true);       
        voters.push(_address);
        console.log("Vote successfully completed to %s ",_to);
        emit Notify(_address,_to);

    }

    function getWinner() external view returns (Candidate memory ) {
        for(uint i=0;i<candidates.length;i++){
            if(candidates[i].totalVote>candidates[i+1].totalVote){
                return candidates[i];
            }else {
                return candidates[i+1];
            }
        }
        
    }

}
