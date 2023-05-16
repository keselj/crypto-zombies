// Give our contract a uint variable called attackVictoryProbability, and set it equal to 70.

// Create a function called attack. It will take two parameters:
// _zombieId (a uint) and _targetId (also a uint). It should be an external function.

pragma solidity >=0.5.0 <0.6.0;
import "./zombiehelper.sol";
contract ZombieAttack is ZombieHelper {
  uint randNonce = 0;
  uint attackVictoryProbability = 70; // This line of code was added 

  function randMod(uint _modulus) internal returns(uint) {
    randNonce++;
    return uint(keccak256(abi.encodePacked(now, msg.sender, randNonce))) % _modulus;
  }
    // This function was added
  function attack(uint _zombieId, uint _targetId) external {
  }
}
