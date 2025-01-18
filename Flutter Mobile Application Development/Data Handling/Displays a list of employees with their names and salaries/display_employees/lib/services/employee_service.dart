import 'dart:convert';

import '../models/employee_model.dart';
import 'package:http/http.dart' as http;


class EmployeeService {
  String url = "https://jsonplaceholder.typicode.com/users";

  Future<List<Employee>> getEmployees() async {
    final response =  await http.get(Uri.parse(url));
    List<Employee> employees = [];
    
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      data.forEach((employeeData) {
        employees.add(Employee.fromJson(employeeData));
      });
    } else {
      throw Exception("Failed to load Data , Error : ${response.statusCode}");
    }

    return employees;

  }
}

