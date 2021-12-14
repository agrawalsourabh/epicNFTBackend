
const hre = require("hardhat");

async function main() {
  
  const nftContractFactory = await hre.ethers.getContractFactory("MyEpicNFT");
  const nftEpicContract = await nftContractFactory.deploy();

  await nftEpicContract.deployed();

  console.log("MyEpicNFT contract deployed to:", nftEpicContract.address);

  let txn = await nftEpicContract.makeAnEpicNFT();
  await txn;

  console.log("TXN1 : " , txn);

  txn = await nftEpicContract.makeAnEpicNFT();
  await txn;

  console.log("TXN2 : " , txn);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
