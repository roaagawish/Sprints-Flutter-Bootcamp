import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/employee_model.dart';

class PreferencesService {
    List<Employee> cachedEmployee = [];
    Future<List<Employee>>  getEmployeeFromCached() async{
    final prefs = await SharedPreferences.getInstance();
    var cachedData = prefs.getString("cachedEmployeeData");
    if (cachedData != null ) {
    var jsonData = jsonDecode(cachedData);
    jsonData.forEach((item) {cachedEmployee.add(Employee.fromJson(item));}); 
    }
    return cachedEmployee;
  }
}