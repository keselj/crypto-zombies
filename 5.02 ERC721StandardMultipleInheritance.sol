// Import erc721.sol into zombieownership.sol

// Declare that ZombieOwnership inherits from ZombieAttack AND ERC721

pragma solidity >=0.5.0 <0.6.0;

import "./zombieattack.sol";
import "./erc721.sol"; // This line of code was added

contract ZombieOwnership is ZombieAttack, ERC721 {

}
