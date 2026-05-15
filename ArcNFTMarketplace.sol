// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";

contract ArcNFTMarketplace is ReentrancyGuard {
    uint256 private _listingIds;
    address public marketplaceOwner;
    uint256 public platformFee = 0.025 ether; // Example listing fee

    struct Listing {
        uint256 listingId;
        address nftContract;
        uint256 tokenId;
        address payable seller;
        uint256 price;
        bool isSold;
    }

    mapping(uint256 => Listing) private listings;

    event NFTListed(uint256 indexed listingId, address indexed nftContract, uint256 indexed tokenId, address seller, uint256 price);
    event NFTSold(uint256 indexed listingId, address indexed nftContract, uint256 indexed tokenId, address buyer, uint256 price);

    constructor() {
        marketplaceOwner = msg.sender;
    }

    // 1. List an NFT for sale on the marketplace
    function listNFT(address nftContract, uint256 tokenId, uint256 price) public payable nonReentrant {
        require(price > 0, "Price must be at least 1 wei");
        require(msg.value == platformFee, "Must pay the platform fee");

        _listingIds++;
        uint256 listingId = _listingIds;

        listings[listingId] = Listing(
            listingId,
            nftContract,
            tokenId,
            payable(msg.sender),
            price,
            false
        );

        // Transfer ownership of the NFT to the marketplace contract
        IERC721(nftContract).transferFrom(msg.sender, address(this), tokenId);

        emit NFTListed(listingId, nftContract, tokenId, msg.sender, price);
    }

    // 2. Buy a listed NFT
    function buyNFT(uint256 listingId) public payable nonReentrant {
        Listing storage listing = listings[listingId];
        require(msg.value >= listing.price, "Not enough funds sent");
        require(!listing.isSold, "NFT already sold");

        listing.isSold = true;
        
        // Pay the seller
        listing.seller.transfer(msg.value);
        
        // Transfer the NFT to the buyer
        IERC721(listing.nftContract).transferFrom(address(this), msg.sender, listing.tokenId);

        // Transfer the listing fee to the marketplace owner
        payable(marketplaceOwner).transfer(platformFee);

        emit NFTSold(listingId, listing.nftContract, listing.tokenId, msg.sender, listing.price);
    }

    // Function to view listing details
    function getListing(uint256 listingId) public view returns (Listing memory) {
        return listings[listingId];
    }
}
