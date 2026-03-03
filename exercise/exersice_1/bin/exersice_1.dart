import 'dart:io';
import 'package:exersice_1/employee.dart';
import 'package:exersice_1/sales_employee.dart';
import 'package:exersice_1/developer.dart';
void main(List<String> arguments) {
  List<Employee> employees = [];

  var sales = SalesEmployee(
    id: 'S01',
    name: 'Nguyễn Văn A',
    birth: DateTime(1995, 10, 20),
    phoneNumber: '0901234567',
    address: 'Hà Nội',
    baseSalary: 5000000,
    revenue: 50000000,
  );

  var dev = Developer(
    id: 'D01',
    name: 'Trần Thị B',
    birth: DateTime(1998, 5, 12),
    phoneNumber: '0988888888',
    address: 'TP.HCM',
    baseSalary: 15000000,
    level: 'Senior',
  );

  employees.addAll([sales, dev]);
  
  print("Danh sach nhan vien");

  employees.forEach((employee) => employee.displayInfo());

  print("\n--- Dang cap nhat thong tin... ---\n");
  sleep(Duration(seconds: 2));

  for (var employee in employees) {
    if (employee is Developer) {
      employee.setLevel = "middle";
    }
    if (employee is SalesEmployee) {
      employee.setRevenue = 3000.0;
    }
  }

  print("Danh sach nhan vien sau khi cap nhat:");
  employees.forEach((employee) => employee.displayInfo());


}
