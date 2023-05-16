/* First we need to make sure that _targetDna isn't longer than 16 digits.
To do this, we can set _targetDna equal to _targetDna % dnaModulus to only take the last 16 digits.

Next our function should declare a uint named newDna, and set it equal to the average of myZombie's DNA
and _targetDna (as in the example above).

Once we have the new DNA, let's call _createZombie. 
You can look at the zombiefactory.sol tab if you forget which parameters this function needs to call it.
Note that it requires a name, so let's set our new zombie's name to "NoName"
for now — we can write a function to change zombies' names later. */

pragma solidity >=0.5.0 <0.6.0;

import "./zombiefactory.sol";

contract ZombieFeeding is ZombieFactory {

  function feedAndMultiply(uint _zombieId, uint _targetDna) public {
    require(msg.sender == zombieToOwner[_zombieId]);
    Zombie storage myZombie = zombies[_zombieId];
    _targetDna = _targetDna % dnaModulus; // This line of code was added
    uint newDna = (myZombie.dna + _targetDna) / 2; // This line of code was added
    _createZombie("NoName", newDna); // This line of code was added
  }

}
