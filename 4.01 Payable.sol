// Define a uint named levelUpFee, and set it equal to 0.001 ether.

// Create a function named levelUp. It will take one parameter, _zombieId, a uint. It should be external and payable.

// The function should first require that msg.value is equal to levelUpFee.

// It should then increment this zombie's level: zombies[_zombieId].level++.

pragma solidity >=0.5.0 <0.6.0;
import "./zombiefeeding.sol";
contract ZombieHelper is ZombieFeeding {

  uint levelUpFee = 0.001 ether; // This line of code was added

  modifier aboveLevel(uint _level, uint _zombieId) {
    require(zombies[_zombieId].level >= _level);
    _;
  }
  
    // This function was added
  function levelUp(uint _zombieId) external payable {
    require(msg.value == levelUpFee);
    zombies[_zombieId].level++;
  }

  function changeName(uint _zombieId, string calldata _newName) external aboveLevel(2, _zombieId) {
    require(msg.sender == zombieToOwner[_zombieId]);
    zombies[_zombieId].name = _newName;
  }

  function changeDna(uint _zombieId, uint _newDna) external aboveLevel(20, _zombieId) {
    require(msg.sender == zombieToOwner[_zombieId]);
    zombies[_zombieId].dna = _newDna;
  }

  function getZombiesByOwner(address _owner) external view returns(uint[] memory) {
    uint[] memory result = new uint[](ownerZombieCount[_owner]);
    uint counter = 0;
    for (uint i = 0; i < zombies.length; i++) {
      if (zombieToOwner[i] == _owner) {
        result[counter] = i;
        counter++;
      }
    }
    return result;
  }

}
