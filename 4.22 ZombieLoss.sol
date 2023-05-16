/* Add an else statement. If our zombie loses:

a. Increment myZombie's lossCount.

b. Increment enemyZombie's winCount.

c. Run the _triggerCooldown function on myZombie. This way the zombie can only attack once per day. 
(Remember, _triggerCooldown is already run inside feedAndMultiply. 
So the zombie's cooldown will be triggered whether he wins or loses.) */

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
    if (rand <= attackVictoryProbability) {
      myZombie.winCount++;
      myZombie.level++;
      enemyZombie.lossCount++;
      feedAndMultiply(_zombieId, enemyZombie.dna, "zombie");
    } else { // Else was added to this function
      myZombie.lossCount++;
      enemyZombie.winCount++;
      _triggerCooldown(myZombie);
    }
  }
}
