/* Declare a uint called cooldownTime, and set it equal to 1 days.
 (Forgive the poor grammar — if you set it equal to "1 day", it won't compile!)

Since we added a level and readyTime to our Zombie struct in the previous chapter,
we need to update _createZombie() to use the correct number of arguments when we create a new Zombie struct.

Update the zombies.push line of code to add 2 more arguments: 1 (for level),
and uint32(now + cooldownTime) (for readyTime).*/

pragma solidity >=0.5.0 <0.6.0;
import "./ownable.sol";
contract ZombieFactory is Ownable {

    event NewZombie(uint zombieId, string name, uint dna);

    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;
    uint cooldownTime = 1 days; // This line of code was added

    struct Zombie {
      string name;
      uint dna;
      uint32 level;
      uint32 readyTime;
    }

    Zombie[] public zombies;

    mapping (uint => address) public zombieToOwner;
    mapping (address => uint) ownerZombieCount;

    function _createZombie(string memory _name, uint _dna) internal {
        uint id = zombies.push(Zombie(_name, _dna, 1, uint32(now + cooldownTime))) - 1; // this line of code was edited
        zombieToOwner[id] = msg.sender;
        ownerZombieCount[msg.sender]++;
        emit NewZombie(id, _name, _dna);
    }

    function _generateRandomDna(string memory _str) private view returns (uint) {
        uint rand = uint(keccak256(abi.encodePacked(_str)));
        return rand % dnaModulus;
    }

    function createRandomZombie(string memory _name) public {
        require(ownerZombieCount[msg.sender] == 0);
        uint randDna = _generateRandomDna(_name);
        randDna = randDna - randDna % 100;
        _createZombie(_name, randDna);
    }

}
