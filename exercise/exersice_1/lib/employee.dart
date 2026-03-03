import 'package:intl/intl.dart';

abstract class Employee {
  String _id;
  String _name;
  DateTime _birth;
  String _phoneNumber;
  String _address;
  double _baseSalary;

  Employee({
    required String id, 
    required String name, 
    required DateTime birth, 
    required String phoneNumber, 
    required String address,
    required double baseSalary
  }) : _id = id,
       _name = name,
       _birth = birth,
       _phoneNumber = phoneNumber,
       _address = address,
       _baseSalary = baseSalary;

  String get id => _id;
  set setId(String id) => this._id = id;

  String get name => _name;
  set setName(String name) => this._name = name;

  DateTime get birth => _birth;
  set setBirth(String birth_string) {
    this._birth = DateFormat("dd/MM/yyyy").parse(birth_string);
  }

  String get phoneNumber => _phoneNumber;
  set setPhoneNumber(String phoneNumber) => this._phoneNumber = phoneNumber;

  String get address => _address;
  set setAddress(String address) => this._address = address;

  double get baseSalary => _baseSalary;
  set setBaseSalary(double baseSalary) => this._baseSalary = baseSalary;

  double calculateSalary();

  void displayInfo() {
    print("ID: $_id - Name: $_name - Salary: ${calculateSalary()}");
  }
}
