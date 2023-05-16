// Go ahead and implement SafeMath methods on all the ++ increments in ZombieAttack.
// We've left comments in the code to make them easy to find.

pragma solidity >=0.5.0 <0.6.0;

import "./zombiehelper.sol";

contract ZombieAttack is ZombieHelper {
  uint randNonce = 0;
  uint attackVictoryProbability = 70;

  function randMod(uint _modulus) internal returns(uint) {
    randNonce = randNonce.add(1); // This line of code was modified
    return uint(keccak256(abi.encodePacked(now, msg.sender, randNonce))) % _modulus;
  }

  function attack(uint _zombieId, uint _targetId) external onlyOwnerOf(_zombieId) {
    Zombie storage myZombie = zombies[_zombieId];
    Zombie storage enemyZombie = zombies[_targetId];
    uint rand = randMod(100);
    if (rand <= attackVictoryProbability) {
      myZombie.winCount = myZombie.winCount.add(1); // This line of code was modified
      myZombie.level = myZombie.level.add(1); // This line of code was modified
      enemyZombie.lossCount = enemyZombie.lossCount.add(1); // This line of code was modified
      feedAndMultiply(_zombieId, enemyZombie.dna, "zombie");
    } else {
      myZombie.lossCount = myZombie.lossCount.add(1); // This line of code was modified
      enemyZombie.winCount = enemyZombie.winCount.add(1); // This line of code was modified
      _triggerCooldown(myZombie);
    }
  }
}
