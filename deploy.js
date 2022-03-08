async function main () {
    const NFTFactory = await hre.ethers.getContractFactory("NFTFactory");

    const URI = 'ipfs://QmVRrWSGUbFV1uFsDQxg6swZfzw9s728J8c9hUZw4FTTvY';

    const myContractDeployed = await NFTFactory.deploy();

    await myContractDeployed.deployed();
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });