/* Give our contract a uint called randNonce, and set it equal to 0.

Create a function called randMod (random-modulus). 
It will be an internal function that takes a uint named _modulus, and returns a uint.

The function should first increment randNonce (using the syntax randNonce++).

Finally, it should (in one line of code) calculate the uint typecast of 
the keccak256 hash of abi.encodePacked(now,msg.sender,randNonce) — 
and return that value % _modulus. (Whew! That was a mouthful. If you didn't follow that, 
just take a look at the example above where we generated a random number — the logic is very similar). */

pragma solidity >=0.5.0 <0.6.0;
import "./zombiehelper.sol";
contract ZombieAttack is ZombieHelper {
  uint randNonce = 0; // This line of code was added

    // This function was added
  function randMod(uint _modulus) internal returns(uint) {
    randNonce++;
    return uint(keccak256(abi.encodePacked(now, msg.sender, randNonce))) % _modulus;
  }
}
