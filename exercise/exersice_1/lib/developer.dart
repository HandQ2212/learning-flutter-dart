import 'employee.dart';

class Developer extends Employee {
  String _level;

  Developer({
    required String id,
    required String name,
    required DateTime birth,
    required String phoneNumber,
    required String address,
    required double baseSalary,
    required String level
  }) : _level = level,
       super(
          id: id, 
          name: name, 
          birth: birth, 
          phoneNumber: phoneNumber, 
          address: address, 
          baseSalary: baseSalary
      );

  String get level => _level;
  set setLevel(String level) => this._level = level;

  double getAllowanceByLevel() {
    switch (_level.toLowerCase()) {
      case 'intern': return 100000;
      case 'junior': return 1000000;
      case 'middle': return 2500000;
      case 'senior': return 5000000;
      default: return 0;
    }
  }

  @override
  double calculateSalary() {
    return baseSalary + getAllowanceByLevel();
  }
}