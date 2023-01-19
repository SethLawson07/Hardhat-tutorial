//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

//Patient Data Management Smart Contract
contract DataManage {

    //Definition of data structure
    struct Data {
       string previousIllnesses;
       uint8 age;
       string bloodGroup;
       string sex;
    }

    //mapping that contains data
    mapping(address => Data) data;

    //Definition of customer structure
    struct Customer {
        string name;
        string category;
        string email;
        string tel;
    }

    //mapping that contains customers
    mapping(address => Customer) customers;

    //mapping that contains data access
    mapping(address => address) whoHasAccess;

    event AddData(address _owner,string _previousIllnesses,string _bloodGroup, string _sex,uint8 age);
    event UpdateData(address _owner,string _previousIllnesses,string _bloodGroup, string _sex,uint8 age);
    event DisplayData(address _owner);
    event AddCustomer(address _owner, string name,string category,string email,string tel);
    event UpdateCustomer(address _owner, string name,string category,string email,string tel);

    function addData(address _owner,string memory _previousIllnesses,uint8 _age, string memory _bloodGroup, string memory _sex) external  {
        
        data[_owner]=Data(_previousIllnesses,_age,_bloodGroup,_sex);
    }

    function updateData(address _owner,string memory _previousIllnesses,uint8 _age,string memory _bloodGroup, string memory _sex) external {
        data[_owner]=Data(_previousIllnesses,_age,_bloodGroup,_sex);
    }


    function addAccess(address _owner,address _customer) external {

        whoHasAccess[_owner]=_customer;
    }

    function displayAccess(address _owner) external view returns(address) {

      return  whoHasAccess[_owner];
    }

    function removeAccess(address _owner) external {
        delete whoHasAccess[_owner];
    }

    function displayData(address _owner,address _customer) external view returns (Data memory) {
        bool access = false;
        whoHasAccess[_owner]==_customer ? access = true : access = false;
        if(_owner==_customer){
            access=true;
        }
        require(access);
        return data[_owner];
    }


    function addCustomer(address _owner, string memory _name,string memory _category,string memory _email,string memory _tel) external {
        customers[_owner]=Customer(_name,_category,_email,_tel);
    }

    function updateCustomer(address _owner, string memory _name,string memory _category,string memory _email,string memory _tel) external {
        customers[_owner]=Customer(_name,_category,_email,_tel);
    }

    function displayCustomer(address _customer) external view returns (Customer memory) {
        
        return customers[_customer];
    }

  





}