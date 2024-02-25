// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract storeData {
    address public admin;

    constructor() {
        admin = msg.sender;
    }

    // Define a modifier to restrict access to only the admin
    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can call this function");
        _;
    }

    struct User {
        uint id;
        address userAddress;
        uint userId;
        uint referralUser;
        uint myReferral;
        uint referralPoint;
    }
    
    mapping(address => User) private tele;

    address[] private userAddresses;

    uint count = 1;

    // user registration function
    function registerUser(address _userAddress,uint _userId,uint _referralUser) external returns (bool status,string memory message) {
        
        require(tele[_userAddress].userAddress == address(0),"Please provide valid address");
        require(tele[_userAddress].id > 0 , "User allready exists");

        tele[_userAddress] = User(count,_userAddress, _userId, _referralUser, 0, 0);

        count++;
        userAddresses.push(_userAddress);

        return  (true,"success");
    }
    
    // read user function
    function getUser(address _getAddress) external view returns (address, uint,uint, uint, uint) {
        User memory user = tele[_getAddress];
        return (user.userAddress, user.userId, user.referralUser, user.myReferral, user.referralPoint);
    }
    
    // update user function
    function updateUser(address _updateAddress,uint _myReferral, uint _referralPoint) external onlyAdmin returns(bool status){
        require(tele[_updateAddress].userAddress != address(0), "User does not exist");
        uint liveMyRefferal = tele[_updateAddress].myReferral;
        uint liveRefferalPoint = tele[_updateAddress].referralPoint;

        uint  newMyreferal = (_myReferral > 0) ? liveMyRefferal + 1 : liveMyRefferal;
        uint  newMyreferalPoint = (_referralPoint > 0) ? liveRefferalPoint + _referralPoint : liveRefferalPoint;

        tele[_updateAddress] = User(tele[_updateAddress].id,_updateAddress,tele[_updateAddress].userId, tele[_updateAddress].referralUser, newMyreferal, newMyreferalPoint);
        return true;
    }
    
    // delete user function
    function deleteUser(address _deleteAddress) external onlyAdmin returns (bool status){
        require(tele[_deleteAddress].userAddress != address(0), "User does not exist");
        delete tele[_deleteAddress];
        return true;
    }

    // get all users
    function getAllUsers() external view returns (User[] memory) {
        User[] memory allUsers = new User[](userAddresses.length);
        for (uint i = 0; i < userAddresses.length; i++) {
            allUsers[i] = tele[userAddresses[i]];
        }
        return allUsers;
    }

}
