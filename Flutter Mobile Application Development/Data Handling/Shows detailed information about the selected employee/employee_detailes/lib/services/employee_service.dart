import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/employee_model.dart';


class EmployeeService {
  String endpoint = "https://jsonplaceholder.typicode.com/users";

  Future<List<Employee>> getEmployees() async {
    List<Employee> employees = [];
    final response = await Dio().get(endpoint);
    final prefs = await SharedPreferences.getInstance();
    try {
      var data = response.data;
      var cachedData = jsonEncode(data);
      prefs.setString("employeeData" , cachedData);
      data.forEach((employeeData) {
        Employee employee = Employee.fromJson(employeeData);
        employees.add(employee);
      });
    } catch (e) {
      throw Exception("Error fetching data , Erorr : ${response.statusCode}");
    }

    return employees;

  }
}

