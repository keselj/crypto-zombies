/* Create a function called feedAndMultiply. It will take two parameters: _zombieId (a uint) and _targetDna (also a uint). 
This function should be public.

We don't want to let someone else feed our zombie! So first, let's make sure we own this zombie.
Add a require statement to verify that msg.sender is equal to this zombie's owner
(similar to how we did in the createRandomZombie function).

We're going to need to get this zombie's DNA. So the next thing our function should do is declare a local Zombie named myZombie
(which will be a storage pointer). 
Set this variable to be equal to index _zombieId in our zombies array.*/

pragma solidity >=0.5.0 <0.6.0;

import "./zombiefactory.sol";

contract ZombieFeeding is ZombieFactory {

  function feedAndMultiply(uint _zombieId, uint _targetDna) public { // This line of code was added
    require(msg.sender == zombieToOwner[_zombieId]); // This line of code was added
    Zombie storage myZombie = zombies[_zombieId]; // This line of code was added
  }

}
