
const hre = require("hardhat");

async function main() {
  
  const nftContractFactory = await hre.ethers.getContractFactory("MyEpicNFT");
  const nftEpicContract = await nftContractFactory.deploy();

  await nftEpicContract.deployed();

  console.log("MyEpicNFT contract deployed to:", nftEpicContract.address);

  let image = "PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHByZXNlcnZlQXNwZWN0UmF0aW89InhNaW5ZTWluIG1lZXQiIHZpZXdCb3g9IjAgMCAzNTAgMzUwIj4KICAgIDxzdHlsZT4uYmFzZSB7IGZpbGw6IHdoaXRlOyBmb250LWZhbWlseTogc2VyaWY7IGZvbnQtc2l6ZTogMTRweDsgfTwvc3R5bGU+CiAgICA8cmVjdCB3aWR0aD0iMTAwJSIgaGVpZ2h0PSIxMDAlIiBmaWxsPSJibGFjayIgLz4KICAgIDx0ZXh0IHg9IjUwJSIgeT0iNTAlIiBjbGFzcz0iYmFzZSIgZG9taW5hbnQtYmFzZWxpbmU9Im1pZGRsZSIgdGV4dC1hbmNob3I9Im1pZGRsZSI+TXlTZWNvbmRORlQ8L3RleHQ+Cjwvc3ZnPg==";

  let txn = await nftEpicContract.makeAnEpicNFT("MySecondTestNFT", "This is my second test NFT", image);
  await txn;

  console.log("TXN1 : " , txn);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
