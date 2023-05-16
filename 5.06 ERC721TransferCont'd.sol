/* First, we want to make sure only the owner or the approved address of a token/zombie can transfer it.
 Let's define a mapping called zombieApprovals. It should map a uint to an address. 
 This way, when someone that is not the owner calls transferFrom with a _tokenId, 
 we can use this mapping to quickly look up if he is approved to take that token.

Next, let's add a require statement to transferFrom. 
It should make sure that only the owner or the approved address of a token/zombie can transfer it.

Lastly, don't forget to call _transfer.*/

pragma solidity >=0.5.0 <0.6.0;

import "./zombieattack.sol";
import "./erc721.sol";

contract ZombieOwnership is ZombieAttack, ERC721 {

  mapping (uint => address) zombieApprovals; // This line of code was added

  function balanceOf(address _owner) external view returns (uint256) {
    return ownerZombieCount[_owner];
  }

  function ownerOf(uint256 _tokenId) external view returns (address) {
    return zombieToOwner[_tokenId];
  }

  function _transfer(address _from, address _to, uint256 _tokenId) private {
    ownerZombieCount[_to]++;
    ownerZombieCount[_from]--;
    zombieToOwner[_tokenId] = _to;
    emit Transfer(_from, _to, _tokenId);
  }

  function transferFrom(address _from, address _to, uint256 _tokenId) external payable {
    require (zombieToOwner[_tokenId] == msg.sender || zombieApprovals[_tokenId] == msg.sender); // This line of code was added
    _transfer(_from, _to, _tokenId); // This line of code was added
  }

  function approve(address _approved, uint256 _tokenId) external payable {

  }

}
