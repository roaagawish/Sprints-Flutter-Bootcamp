import 'package:flutter/material.dart';

import '../models/employee_model.dart';


class EmployeeDetaiels extends StatefulWidget {
  final Employee employeeData ;
   // ignore: prefer_const_constructors_in_immutables
   EmployeeDetaiels({super.key , required this.employeeData});

  @override
  State<EmployeeDetaiels> createState() => _EmployeeDetaielsState();
}

class _EmployeeDetaielsState extends State<EmployeeDetaiels> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.employeeData.name),
      ),
      body: SingleChildScrollView(
         child: Padding(
           padding: const EdgeInsets.all(15.0),
           child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment:CrossAxisAlignment.start,
             children: [
               Center(
                 child: CircleAvatar(
                   radius: 50,
                   child: Text("${widget.employeeData.id}", style: TextStyle(fontSize: 30),),
                  //  child: Icon(Icons.person , size: 60,),
                 ),
               ),
               SizedBox(height: 30,),
               //Text("Name : ${widget.employeeData.name}"),
               Text("employeeName : ${widget.employeeData.username}"),
               //Text("Id : ${widget.employeeData.id}"),
               Text("Email : ${widget.employeeData.email}"),
               Text("Phone : ${widget.employeeData.phone}"),
               Text("Website : ${widget.employeeData.website}"),
               Text("Address : ${widget.employeeData.address.street} - ${widget.employeeData.address.suite} - ${widget.employeeData.address.city}" ),
               Text("Company : ${widget.employeeData.company.name} - ${widget.employeeData.company.catchPhrase} - ${widget.employeeData.company.bs}"),
            ],
           ),
         ),
       ),
    );
  }
}