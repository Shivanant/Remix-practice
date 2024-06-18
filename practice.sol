// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

// contract EventExample {
//     event NewTransaction(
//         address indexed from,
//         address indexed to,
//         uint256 amount,
//         string message
//     );

//     event SimpleEvent(
//         string info
//     );

//     uint256 public totalBalance;

//     mapping(address => uint256) public balances;

//     function sendTransaction(address to, uint256 amount, string memory message) public {
//         require(balances[msg.sender] >= amount, "Insufficient balance");

//         balances[msg.sender] -= amount;

//         balances[to] += amount;

//         emit NewTransaction(msg.sender, to, amount, message);
//     }

//     function depositFunds() public payable {
//         require(msg.value > 0, "Must deposit a positive amount");

//         balances[msg.sender] += msg.value;

//         totalBalance += msg.value;

//         emit SimpleEvent("Funds deposited");
//     }

//     function withdrawFunds(uint256 amount) public {
//         require(balances[msg.sender] >= amount, "Insufficient balance");

//         balances[msg.sender] -= amount;

//         totalBalance -= amount;

//         payable(msg.sender).transfer(amount);

//         emit SimpleEvent("Funds withdrawn");
//     }

//     function getBalance(address addr) public view returns (uint256) {
//         return balances[addr];
//     }
//     function getTotalBalance() public view returns (uint256) {
//         return totalBalance;
//     }
// }
// pragma solidity ^0.8.0;

// contract Parent1 {
//     function foo() public virtual returns (string memory) {
//         return "Parent1";
//     }
// }

// contract Parent2 {
//     function foo() public virtual returns (string memory) {
//         return "Parent2";
//     }
// }

// contract Child is Parent1, Parent2 {
//     function foo() public override(Parent1, Parent2) returns (string memory) {
//         // Calling the foo function from Parent1 using super
//         return super.foo();
//     }
// // }
// contract payment{
//     address payable public  owner;
//     constructor(){
//         owner=payable(msg.sender);
//     }

//     function withdraw()public payable {
//         require(msg.sender==owner,"NOt the owner");
//         (bool success,)=owner.call{value:payable (address(this)).balance}("");
//         require(success,"Not success");
//     }
//     function sendmoney()public payable {
//         (bool s,)=payable(address(this)).call{value:msg.value}("");
//         require(s,"Fail");
//     }
//     receive() external payable { }

// }

// contract Delegate {
//     uint256 public number;

//     function setNumber(uint256 _number) public {
//         number = _number;
//     }
// }

// contract MedicalHistory {
//     struct MedicalRecord {
//         uint256 id;
//         string description;
//         uint256 date;
//         address doctor;
//     }

//     struct Patient {
//         uint256 id;
//         string name;
//         address addr;
//     }

//     mapping(address => Patient) private patients;
//     mapping(uint256 => address) private patientIds;
//     mapping(address => mapping(uint256 => MedicalRecord)) private medicalRecords;
//     mapping(address => uint256) private recordCount;

//     uint256 private nextPatientId = 1;

//     address public owner;

//     modifier onlyOwner() {
//         require(msg.sender == owner, "Only the owner can perform this action");
//         _;
//     }

//     modifier onlyPatientOrOwner(address patientAddr) {
//         require(
//             msg.sender == patientAddr || msg.sender == owner,
//             "Only the patient or owner can perform this action"
//         );
//         _;
//     }

//     constructor() {
//         owner = msg.sender;
//     }

//     function registerPatient(string memory name, address addr) public onlyOwner {
//         require(patients[addr].id == 0, "Patient already registered");
//         patients[addr] = Patient(nextPatientId, name, addr);
//         patientIds[nextPatientId] = addr;
//         nextPatientId++;
//     }

//     function addMedicalRecord(
//         address patientAddr,
//         string memory description,
//         uint256 date
//     ) public onlyOwner {
//         require(patients[patientAddr].id != 0, "Patient not registered");
//         uint256 newRecordId = recordCount[patientAddr] + 1;
//         medicalRecords[patientAddr][newRecordId] = MedicalRecord(newRecordId, description, date, msg.sender);
//         recordCount[patientAddr]++;
//     }

//     function getMedicalRecord(address patientAddr, uint256 recordId)
//         public
//         view
//         onlyPatientOrOwner(patientAddr)
//         returns (MedicalRecord memory)
//     {
//         require(patients[patientAddr].id != 0, "Patient not registered");
//         require(recordId > 0 && recordId <= recordCount[patientAddr], "Invalid record ID");
//         return medicalRecords[patientAddr][recordId];
//     }

//     function getRecordCount(address patientAddr)
//         public
//         view
//         onlyPatientOrOwner(patientAddr)
//         returns (uint256)
//     {
//         require(patients[patientAddr].id != 0, "Patient not registered");
//         return recordCount[patientAddr];
//     }

//     function getPatient(address patientAddr)
//         public
//         view
//         onlyPatientOrOwner(patientAddr)
//         returns (Patient memory)
//     {
//         require(patients[patientAddr].id != 0, "Patient not registered");
//         return patients[patientAddr];
//     }
// }
// contract Car {
//     address public owner;
//     string public model;

//     constructor(address _owner, string memory _model) {
//         owner = _owner;
//         model = _model;
//     }
// }

// contract CarFactory {
//     address public owner;
//     address[] public deployedCars;

//     modifier onlyOwner() {
//         require(msg.sender == owner, "Only the owner can perform this action");
//         _;
//     }

//     constructor() {
//         owner = msg.sender;
//     }

//     event CarCreated(address carAddress, address carOwner, string carModel);

//     function createCar(address _owner, string memory _model) public onlyOwner {
//         Car newCar = new Car(_owner, _model);
//         deployedCars.push(address(newCar));
//         emit CarCreated(address(newCar), _owner, _model);
//     }

//     function getDeployedCars() public view returns (address[] memory) {
//         return deployedCars;
//     }
// }
// interface IERC20 {
//     function transfer(address,uint)external ;
    
// }
// contract Token{
//     function transfer(address,uint)external {}

// }
// contract AbiEncode{
//     function test(address _contract,bytes calldata data) external{
//         (bool s,)=_contract.call(data);
//         require(s,"Fail");
//     }

//     function encodewithsign(address to, uint amount)external  pure returns(bytes memory){
//         return abi.encodeWithSignature("transfer(address,uint)",to,amount);
//     }
// }