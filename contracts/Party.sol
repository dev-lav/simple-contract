pragma solidity >=0.7.0 <0.9.0;
pragma abicoder v2;

contract Party{
    
    address public owner;
    
    constructor() {
        owner = msg.sender;
    }
    
    struct partyData {
        int256 id;
        address owner;
        string name;
    }
    
    struct Signing{
        uint8 v;
        bytes32 r;
        bytes32 s;
    }
    
    mapping(address => partyData) public parties;
    
    function createParty(partyData memory party, Signing memory Signatures) public {

        require( owner == recover(party, Signatures), "Caller is not signing message");
        
        parties[msg.sender].id = party.id;
        parties[msg.sender].owner = party.owner;
        parties[msg.sender].name = party.name;
    }
    
    function getEthSignedMessageHash(bytes32 _messageHash) private pure returns (bytes32) {
        return keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", _messageHash));
    }
    
    function recover(partyData memory party, Signing memory Signatures) private returns (address){
        
        bytes32 messageHash = getMessageHash(party);
        bytes32 ethSignedMessageHash = getEthSignedMessageHash(messageHash);
        
        return ecrecover(ethSignedMessageHash, Signatures.v, Signatures.r, Signatures.s );
    }
    
    function getMessageHash(partyData memory party
    )
        public pure returns (bytes32)
    {
        return keccak256(abi.encodePacked(party.id, party.owner, party.name));
    }
}