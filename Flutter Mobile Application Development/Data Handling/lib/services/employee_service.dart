import 'package:dio/dio.dart';

import '../models/employee_model.dart';


class EmployeeService {
  String endpoint = "https://jsonplaceholder.typicode.com/users";

  Future<List<Employee>> getEmployees() async {
    List<Employee> employees = [];
    
    try {
      var response = await Dio().get(endpoint);
      var data = response.data;
      data.forEach((employeeData) {
        Employee employee = Employee.fromJson(employeeData);
        employees.add(employee);
      });
      print(response);
    } catch (e) {
      print(e);
    }

    return employees;

  }
}

