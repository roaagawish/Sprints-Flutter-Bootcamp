import 'package:counter_app_with_flutter_bloc/cubit/counter_cubit.dart';
import 'package:counter_app_with_flutter_bloc/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Counter App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
        useMaterial3: true,
      ),
      home :  BlocProvider(
        create: (context) => CounterCubit(),
        child: Home(),
      ),
    );
  }
}

