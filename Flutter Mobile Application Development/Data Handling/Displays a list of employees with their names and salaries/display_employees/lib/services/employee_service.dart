import 'package:dio/dio.dart';

import '../models/employee_model.dart';
 // import 'package:http/http.dart' as http;


class EmployeeService {
  String url = "https://jsonplaceholder.typicode.com/users";

  Future<List<Employee>> getEmployees() async {
    // final response =  await http.get(Uri.parse(url));
    final response =  await Dio().get(url);
    List<Employee> employees = [];
    
    try {
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

