import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sprints"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: 100,
              height:100,
              child: Image.asset("assets/dart-logo-for-shares.png" )),
            SizedBox(height: 20),
            Container(
              width: 100,
              height: 100,
              child: Image.asset("assets/download.png")),
            SizedBox(height: 20,),
            Text("Sprints Flutter BootCamp" , style: TextStyle( fontSize: 20 , color: Colors.blue , fontWeight: FontWeight.w700),)
          ],
        ),
      ),
    );
  }
}