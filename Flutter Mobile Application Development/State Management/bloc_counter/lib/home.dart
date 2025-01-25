import 'package:bloc_counter/bloc/counter_bloc/counter_bloc.dart';
import 'package:bloc_counter/bloc/theme_bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter"),
        actions: [
          Icon(Icons.light_mode),
          // BlocBuilder usage for the theme
          BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              return IconButton(
                  onPressed: () {
                    context.read<ThemeBloc>().add(ToggleTheme());
                  },
                  icon: state.themeMode == ThemeMode.light
                      ? Icon(Icons.toggle_off)
                      : Icon(Icons.toggle_on));
            },
          ),
          Icon(Icons.dark_mode)
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // BlocConsumer usage
          BlocConsumer<CounterBloc, CounterState>(
            listener: (context, state) {
              if (state.counter == 6) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Counter reached 6.")));
              }
            },
            builder: (context, state) {
              return Text(
                "${state.counter}",
                style: TextStyle(fontSize: 50),
              );
            },
          ),

          // BlocBuilder Usage
          BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              if (state.counter % 2 == 0) {
                return Text(
                  "Even Number",
                  style: TextStyle(fontSize: 20),
                );
              }
              return Text(
                "Odd Number",
                style: TextStyle(fontSize: 20),
              );
            },
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                  backgroundColor: Theme.of(context).primaryColor,
                  radius: 30,
                  child: Center(
                    child: IconButton(
                      onPressed: () {
                        context.read<CounterBloc>().add(DecrementCounter());
                      },
                      icon: Icon(
                        Icons.minimize,
                        size: 30,
                      ),
                    ),
                  )),
              SizedBox(
                width: 50,
              ),
              CircleAvatar(
                  backgroundColor: Theme.of(context).primaryColor,
                  radius: 30,
                  child: IconButton(
                    onPressed: () {
                      context.read<CounterBloc>().add(IncrementCounter());
                    },
                    icon: Icon(
                      Icons.add,
                      size: 30,
                    ),
                  ))
            ],
          ),
          SizedBox(
            height: 30,
          ),
          BlocListener<CounterBloc, CounterState>(
            listener: (context, state) {
              
            },
            child: ElevatedButton(
                onPressed: () {
                  context.read<CounterBloc>().add(ResetCounter());
                },
                child: Text("Reset Counter")),
          )
        ],
      ),
    );
  }
}
