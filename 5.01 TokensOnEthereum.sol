// Declare our pragma version at the top of the file (check previous lessons' files for the syntax).

// This file should import from zombieattack.sol.

// Declare a new contract, ZombieOwnership, that inherits from ZombieAttack.
// Leave the body of the contract empty for now


// Everything below was added 

pragma solidity >=0.5.0 <0.6.0; 

import "./zombieattack.sol";

contract ZombieOwnership is ZombieAttack {

}
