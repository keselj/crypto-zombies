// Create a new function named getZombiesByOwner. It will take one argument, an address named _owner.

// Let's make it an external view function, so we can call it from web3.js without needing any gas.

// The function should return a uint[] (an array of uint) as memory data location.

pragma solidity >=0.5.0 <0.6.0;
import "./zombiefeeding.sol";
contract ZombieHelper is ZombieFeeding {

  modifier aboveLevel(uint _level, uint _zombieId) {
    require(zombies[_zombieId].level >= _level);
    _;
  }

  function changeName(uint _zombieId, string calldata _newName) external aboveLevel(2, _zombieId) {
    require(msg.sender == zombieToOwner[_zombieId]);
    zombies[_zombieId].name = _newName;
  }

  function changeDna(uint _zombieId, uint _newDna) external aboveLevel(20, _zombieId) {
    require(msg.sender == zombieToOwner[_zombieId]);
    zombies[_zombieId].dna = _newDna;
  }
    // This function was added
  function getZombiesByOwner(address _owner) external view returns(uint[] memory) {

  }

}
