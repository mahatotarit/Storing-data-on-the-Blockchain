const ethers = require('ethers');
const dotenv = require('dotenv');

const contractABI = require('./ContractABI.json');

dotenv.config();

// Connect to an Ethereum sepolia node
const provider = new ethers.providers.JsonRpcProvider('https://eth-sepolia.g.alchemy.com/v2/b1qu65NnDmm0ngvQY49HrF2aD2_oD5ih');

const privateKey = process.env.PRIVATE_KEY;
const wallet = new ethers.Wallet(privateKey, provider);

// Instantiate the contract
const contractAddress = process.env.SMART_CONTRACT_ADDRESS;

const contract = new ethers.Contract(contractAddress, contractABI, wallet);

// Example function call: Register a user
async function registerUser(userAddress, userId, referralUser) {
  try {
    const tx = await contract.registerUser(userAddress, userId, referralUser);
    await tx.wait();
    console.log('User registered successfully!', "  tx hash: ", tx.hash);
  } catch (error) {
    console.error('Error registering user:', error);
  }
}

// Example function call: Update a user
async function updateUser(updateAddress, myReferral, referralPoint) {
  try {
    const tx = await contract.updateUser(updateAddress, myReferral, referralPoint);
    await tx.wait();
    console.log('User updated successfully!');
  } catch (error) {
    console.error('Error updating user:', error);
  }
}

// Example function call: Delete a user
async function deleteUser(deleteAddress) {
  try {
    const tx = await contract.deleteUser(deleteAddress);
    await tx.wait();
    console.log('User deleted successfully!');
  } catch (error) {
    console.error('Error deleting user:', error);
  }
}


// Example function call: Get all users
async function getAllUsers() {
  try {
    const users = await contract.getAllUsers();
    console.log('All users:', users);
  } catch (error) {
    console.error('Error getting all users:', error);
  }
}

async function getUser(userAddress) {
  try {
    const tx = await contract.getUser(userAddress);
    await tx.wait();

    console.log(tx);

  } catch (error) {
    console.error('Error deleting user:', error);
  }
}


registerUser('0x9D7f74d0C41E726EC95884E0e97Fa6129e3b5E99', 1, 1);