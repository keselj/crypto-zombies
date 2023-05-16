/* Add the ownerOf modifier to attack to make sure the caller owns _zombieId.

The first thing our function should do is get a storage pointer to both zombies so we can more easily interact with them:

a. Declare a Zombie storage named myZombie, and set it equal to zombies[_zombieId].

b. Declare a Zombie storage named enemyZombie, and set it equal to zombies[_targetId].

We're going to use a random number between 0 and 99 to determine the outcome of our battle. 
So declare a uint named rand, and set it equal to the result of the randMod function with 100 as an argument. */

pragma solidity >=0.5.0 <0.6.0;
import "./zombiehelper.sol";
contract ZombieAttack is ZombieHelper {
  uint randNonce = 0;
  uint attackVictoryProbability = 70;

  function randMod(uint _modulus) internal returns(uint) {
    randNonce++;
    return uint(keccak256(abi.encodePacked(now, msg.sender, randNonce))) % _modulus;
  }

    // Modifier was added to this fuction and function was
  function attack(uint _zombieId, uint _targetId) external ownerOf(_zombieId) {
    Zombie storage myZombie = zombies[_zombieId];
    Zombie storage enemyZombie = zombies[_targetId];
    uint rand = randMod(100);
  }
}
