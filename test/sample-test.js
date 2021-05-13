const { expect } = require("chai");

describe("Greeter", function() {
  let User, user, account, addr1, addr2;

  beforeEach(async() => {
    User = await ethers.getContractFactory('User');
    user = await User.deploy();
    [account,addr1, addr2, _] = await ethers.getSigners();
});

  describe('Deployment', () => {
    it('should set the right account',async() => {
        expect(await user.account()).to.equal(account.address);
    });

    it('get new user details',async() => {
      await user.addUser('raviks','password1','Ravi','Kumar','Sudhan','Manager','+9194838545345','','','','')
      await user.addUserAddress('raviks','addressline1','addressline2','','','','','Tamilnadu','India')
      await user.addUser('rajuvinay','password2','Raju','Suresh','Kumar','Assistant','+91767348674','','','','')
      await user.addUserAddress('rajuvinay','No 13, KK Street','SSN Nagar','','','','','Tamilnadu','India')

      console.log(await user.validateUser('raviks','password1'));
      console.log(await user.validateUser('rajuvinay','password2'));
      console.log(await user.getUser('raviks'));
      console.log(await user.getUserAddress('raviks'));
      console.log(await user.getUser('rajuvinay'));
      console.log(await user.getUserAddress('rajuvinay'));
    });

  });


});
