//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract User {

  struct UserDetails {
    string userName;
    string password;
    string firstName;
    string middleName;
    string lastName;
    string occupation;
    string landNumber;
    string mobileNumber;
    string dateofAppl;
    string dateofReg;
    string nominalRoll;
    string addressLine1;
    string addressLine2;
    string addressLine3;
    string pin;
    string street;
    string city;
    string state;
    string country;
  }

  address public account;
  mapping(string => UserDetails) users;

  constructor() {
      account = msg.sender;
  }

  function addUser(string memory userName,
                  string memory password,
                  string memory firstName,
                  string memory middleName,
                  string memory lastName,
                  string memory occupation,
                  string memory landNumber,
                  string memory mobileNumber,
                  string memory dateofAppl,
                  string memory dateofReg,
                  string memory nominalRoll) public {
      UserDetails memory ud = UserDetails(
        userName,
        password,
        firstName,
        middleName,
        lastName,
        occupation,
        landNumber,
        mobileNumber,
        dateofAppl,
        dateofReg,
        nominalRoll,
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        ""
      );
      users[ud.userName] = ud;
  }

  function addUserAddress(string memory userName,
                          string memory addressLine1,
                          string memory addressLine2,
                          string memory addressLine3,
                          string memory pin,
                          string memory street,
                          string memory city,
                          string memory state,
                          string memory country) public payable {
       UserDetails memory ud = users[userName];
       ud.addressLine1 = addressLine1;
       ud.addressLine2 = addressLine2;
       ud.addressLine3 = addressLine3;
       ud.pin = pin;
       ud.street = street;
       ud.city = city;
       ud.state = state;
       ud.country = country;
       users[userName] = ud;
    } 

  function validateUser(string memory userName, string memory password) public view returns (string memory) {
      UserDetails memory ud = users[userName];
      if (keccak256(bytes(password)) != keccak256(bytes(ud.password))) {
            return 'Username or Password is incorrect';
      }
      return 'user authenticated';
  }

  function getUser(string memory userName) public view returns (string memory, string memory,string memory,string memory,string memory,string memory,string memory,string memory,string memory) {
      UserDetails memory ud = users[userName];
      return (
        ud.firstName,
        ud.middleName,
        ud.lastName,
        ud.occupation,
        ud.landNumber,
        ud.mobileNumber,
        ud.dateofAppl,
        ud.dateofReg,
        ud.nominalRoll
      );
  }

    function getUserAddress(string memory userName) public view returns (string memory, string memory,string memory,string memory,string memory,string memory,string memory,string memory) {
      UserDetails memory ud = users[userName];
      return (
        ud.addressLine1,
        ud.addressLine2,
        ud.addressLine3,
        ud.pin,
        ud.street,
        ud.city,
        ud.state,
        ud.country
      );
  }

}
