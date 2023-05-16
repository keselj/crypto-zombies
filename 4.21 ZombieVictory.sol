/* Create an if statement that checks if rand is less than or equal to attackVictoryProbability.

If this condition is true, our zombie wins! So:

a. Increment myZombie's winCount.

b. Increment myZombie's level. (Level up!!!!!!!)

c. Increment enemyZombie's lossCount. (Loser!!!!!! 😫 😫 😫)

d. Run the feedAndMultiply function. Check zombiefeeding.sol to see the syntax for calling it. 
For the 3rd argument (_species), pass the string "zombie". (It doesn't actually do anything at the moment, 
but later we could add extra functionality for spawning zombie-based zombies if we wanted to). */

pragma solidity >=0.5.0 <0.6.0;
import "./zombiehelper.sol";
contract ZombieAttack is ZombieHelper {
  uint randNonce = 0;
  uint attackVictoryProbability = 70;

  function randMod(uint _modulus) internal returns(uint) {
    randNonce++;
    return uint(keccak256(abi.encodePacked(now, msg.sender, randNonce))) % _modulus;
  }

  function attack(uint _zombieId, uint _targetId) external ownerOf(_zombieId) {
    Zombie storage myZombie = zombies[_zombieId];
    Zombie storage enemyZombie = zombies[_targetId];
    uint rand = randMod(100);
    if (rand <= attackVictoryProbability) { // If was added to this function
      myZombie.winCount++;
      myZombie.level++;
      enemyZombie.lossCount++;
      feedAndMultiply(_zombieId, enemyZombie.dna, "zombie");
    }
  }
}
