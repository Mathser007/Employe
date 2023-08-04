
import 'package:flutter/material.dart';

import 'Employee.dart';
import 'api.dart';
import 'database.dart';



class EmployeeProvider extends ChangeNotifier {
  final EmployeeDatabase _employeeDatabase = EmployeeDatabase();
  ApiService apiService=ApiService();
  List<Employee> _employees = [];

  List<Employee> get employees => _employees;

  Future<void> fetchEmployees() async {
    if (_employees.isEmpty) {
      _employees = await _employeeDatabase.getEmployees();
      notifyListeners();
    }

    if(_employees.length==0){
      _employees=await apiService.getUsers();
      print("updated");
      notifyListeners();
    }
  }

  List<Employee> searchEmployees(String query) {
    if (query.isEmpty) {
      return _employees;
    } else {
      return _employees.where((employee) =>
      employee.name.toLowerCase().contains(query.toLowerCase()) ||
          employee.email.toLowerCase().contains(query.toLowerCase())).toList();
    }
  }
}