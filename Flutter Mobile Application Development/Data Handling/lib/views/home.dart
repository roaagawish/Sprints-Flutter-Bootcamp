import 'package:display_employees/models/employee_model.dart';
import 'package:display_employees/services/employee_service.dart';
import 'package:display_employees/views/employee_detaiels.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Employee> employee = [];
  bool loading = true;

  getemployeeData() async {
    employee = await EmployeeService().getEmployees();
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
                         subtitle: Text("email : ${employee[index].email}"),
                         leading: CircleAvatar(
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
