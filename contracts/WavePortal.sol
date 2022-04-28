/// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract WavePortal {
    uint256 totalWaves;
    
    struct Wave {
    address from;
    string message;
    }

    Wave[] waves;
    mapping (address => uint256[]) addressIndex;

    constructor() {
        console.log("Hola, I am a contract and I am smart");

    }

    function wave(string calldata _message) external {
        addressIndex[msg.sender].push(waves.length);
        waves.push(Wave(msg.sender,_message));
        totalWaves += 1;
        console.log("%s has waved!", msg.sender);

    }

    function getTotalWaves() public view returns (uint256) {
        console.log("We have %d total waves!", totalWaves);
        return totalWaves;
    }



    function getMyWaves() external view returns (Wave[] memory) {
        return getWavesFrom(msg.sender);
    }

    
    function getWavesFrom(address _address) public view returns (Wave[] memory) {
     uint256[] storage waveIndex = addressIndex[msg.sender];
     uint256 waveCount = waveIndex.length;
     require (waveCount > 0, "Address has not wave");
     
       Wave[] memory wavesOf = new Wave[](waveCount);
        for (uint256 i = 0; i < waveCount; i++) {
            wavesOf[i] = waves[waveIndex[i]];
        
        }

        console.log("%s has waved %d time(s)!", _address, waveCount);
        
        return wavesOf;
    }
}