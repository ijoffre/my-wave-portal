// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract WavePortal {
    uint256 totalWaves;

    struct User {
    string name;
    string country;
    }

    mapping (address => User) userStructs;

    address [] public userAddress;

    constructor() {
        console.log("Hola, I am a contract and I am smart");


    }
        function wave() public {
        totalWaves += 1;
        console.log("%s has waved!", msg.sender);
    }

    function getTotalWaves() public view returns (uint256) {
        console.log("We have %d total waves!", totalWaves);
        return totalWaves;
    }

    function createUser(string memory name, string memory country) public {
        //set User name using mapping
        userStructs[msg.sender].name = name;
        console.log("Name from mapping: ",name);

        //set User country using mapping
        userStructs[msg.sender].country = country;
        console.log("Country from mapping:", country);

        //push user address into array
        userAddress.push(msg.sender);

    }

    function getAllUsers() external view returns (address[] memory) {
      
          return userAddress;

    }
        

  
}
    