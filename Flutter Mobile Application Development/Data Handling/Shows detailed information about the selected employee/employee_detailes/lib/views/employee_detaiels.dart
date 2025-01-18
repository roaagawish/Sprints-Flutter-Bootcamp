import 'package:flutter/material.dart';

import '../models/employee_model.dart';

class EmployeeDetaiels extends StatefulWidget {
  final Employee employeeData;
  // ignore: prefer_const_constructors_in_immutables
  EmployeeDetaiels({super.key, required this.employeeData});

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
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 15,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.teal[300],
                  child: Text(
                    "${widget.employeeData.id}",
                    style: TextStyle(fontSize: 30),
                  ),
                  //  child: Icon(Icons.person , size: 60,),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: "Name : ",
                    style:TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                TextSpan(text: "${widget.employeeData.name}")
              ])),
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: "Username : ",
                    style:TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                TextSpan(text: "${widget.employeeData.username}")
              ])),
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: "Email : ",
                    style:TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                TextSpan(text: "${widget.employeeData.email}")
              ])),
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: "Phone : ",
                    style:TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                TextSpan(text: "${widget.employeeData.phone}")
              ])),
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: "Website : ",
                    style:TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                TextSpan(text: "${widget.employeeData.website}")
              ])),
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: "Address : ",
                    style:TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                TextSpan(text: "${widget.employeeData.address.street} - ${widget.employeeData.address.suite} - ${widget.employeeData.address.city}")
              ])),
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: "ZipCode : ",
                    style:TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                TextSpan(text: "${widget.employeeData.address.zipcode}")
              ])),
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: "Company : ",
                    style:TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                TextSpan(text: "${widget.employeeData.company.name} - ${widget.employeeData.company.catchPhrase} - ${widget.employeeData.company.bs}")
              ])),
          
            ],
          ),
        ),
      ),
    );
  }
}
