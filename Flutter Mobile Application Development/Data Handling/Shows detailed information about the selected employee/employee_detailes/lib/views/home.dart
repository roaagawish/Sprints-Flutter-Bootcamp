
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/employee_model.dart';
import '../services/employee_service.dart';
import '../services/preferences_service.dart';
import 'employee_detaiels.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Employee> employee = [];
  bool loading = true;

  getemployeeData() async {
     employee =  await PreferencesService().getEmployeeFromCached(); 
      print("cached");
    if (employee.isEmpty) {
     employee = await EmployeeService().getEmployees();  
     print("server");
    } 
     
    loading = false;
    setState(() {});
  }



  @override
  void initState() {
    super.initState();
    getemployeeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Employees List"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: 
      loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          :
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 15),
             child: ListView.builder(
                
                 itemBuilder: (context, index) => 
                 InkWell(
                   onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder:  (context) => EmployeeDetaiels(employeeData: employee[index])));
                   },
                   child: ListTile(
                         title: Text(employee[index].name),
                         subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text("email : ${employee[index].email}"),
                             Text("company : ${employee[index].company.name}"),
                           ],
                         ),
                         leading: CircleAvatar(
                          backgroundColor: Colors.teal[300],
                           radius: 20,
                           child: Text(employee[index].id.toString()),
                         ),
                       ),
                 ),
                 itemCount: employee.length),
           ),
    );
  }
}
