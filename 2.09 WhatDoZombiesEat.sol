// Define an interface called KittyInterface.
// Remember, this looks just like creating a new contract — we use the contract keyword.

// Inside the interface, define the function getKitty (which should be a copy/paste of the function above,
// but with a semi-colon after the returns statement, instead of everything inside the curly braces).

pragma solidity >=0.5.0 <0.6.0;

import "./zombiefactory.sol";

// from line 12 till line 25 was added
contract KittyInterface {
    function getKitty(uint256 _id) external view returns (
    bool isGestating,
    bool isReady,
    uint256 cooldownIndex,
    uint256 nextActionAt,
    uint256 siringWithId,
    uint256 birthTime,
    uint256 matronId,
    uint256 sireId,
    uint256 generation,
    uint256 genes
) ;
}

contract ZombieFeeding is ZombieFactory {

  function feedAndMultiply(uint _zombieId, uint _targetDna) public {
    require(msg.sender == zombieToOwner[_zombieId]);
    Zombie storage myZombie = zombies[_zombieId];
    _targetDna = _targetDna % dnaModulus;
    uint newDna = (myZombie.dna + _targetDna) / 2;
    _createZombie("NoName", newDna);
  }

}
