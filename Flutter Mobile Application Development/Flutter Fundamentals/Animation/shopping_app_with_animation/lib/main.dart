import 'package:flutter/material.dart';
import 'package:shopping_app_with_animation/sign_up.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xffd0aad1)),
        useMaterial3: true,
      ),
      home: SignUp(),
    );
  }
}