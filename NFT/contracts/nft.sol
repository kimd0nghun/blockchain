//SPDX-License-Identifier: MIT

pragma solidity >=0.4.21;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
contract NFT is ERC721 {

    uint256 tokenId = 1;
    uint256 totalTokenCount =0;
    uint time;
    struct img{
        string _tokenName;
        uint256 _tokenId;
        address _owner;
    }
    mapping(uint256 => string) private _tokenURIs;
    
    constructor() public ERC721("DONGHUN", "HUN") {
        
    }
    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        return _tokenURIs[tokenId];
    } 
    function mintNFT(address to, string memory tokenURI) public returns(uint256) {
        uint256 Id;
        Id = tokenId;
        _mint(to, tokenId);
        totalTokenCount++;
        img memory  _img = img("zoom", Id, to);
        _tokenURIs[tokenId] = tokenURI;
        tokenId++;
        return Id;
        
    }
    
    function viewTotalTokenBalance() public view returns(uint256){
        return totalTokenCount;
    }
}