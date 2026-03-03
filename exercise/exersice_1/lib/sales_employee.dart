import 'employee.dart';

class SalesEmployee extends Employee {
  double _revenue;

  SalesEmployee({
    required String id,
    required String name,
    required DateTime birth,
    required String phoneNumber,
    required String address,
    required double baseSalary,
    double revenue = 0.0,
  }) : _revenue = revenue,
       super(
          id: id, 
          name: name, 
          birth: birth, 
          phoneNumber: phoneNumber, 
          address: address, 
          baseSalary: baseSalary
      );

  double get revenue => _revenue;

  set setRevenue(double revenue) => this._revenue = revenue;

  @override
  double calculateSalary() {
    return (_revenue * 0.1) + baseSalary;
  }
}