import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue, // set appbar color
        title: Text("My First Project"), //set title
        centerTitle: true, // center the title
      ),
      body: Center(
        // center the child of the body
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // stracture the project as column
          children: [
            Row(
              mainAxisAlignment:  MainAxisAlignment.center,
                children: [
              Container(
                  width: 150,
                  height: 150,
                  // asset image
                  child: Image.asset("assets/dart-logo-for-shares.png")),
              SizedBox(width: 20), // space between the two images
              Container(
                  width: 150,
                  height: 150,
                  //network image
                  child: Image.network(
                      "https://cdn.prod.website-files.com/654366841809b5be271c8358/659efd7c0732620f1ac6a1d6_why_flutter_is_the_future_of_app_development%20(1).webp"))
            ]),
            SizedBox(
              height: 20,
            ),
            //add text
            Text(
              "The two images are displayed",
              // style the text
              style: TextStyle(
                  fontFamily: 'Suwannaphum',
                  fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
