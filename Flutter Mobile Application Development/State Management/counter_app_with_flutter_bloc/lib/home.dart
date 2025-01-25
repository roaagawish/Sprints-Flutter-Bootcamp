import 'package:counter_app_with_flutter_bloc/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body:
      // BlocListener Usage
       BlocListener<CounterCubit, CounterState>(
        listener: (context, state) {
          if (state.counter < 0) {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: Text("Alert"),
                      content: Text("Counter reached negative values "),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("Ok"))
                      ],
                    ));
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // BlocConsumer usage
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.counter == 10 || state.counter == -10) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Counter reached ${state.counter}")));
                }
              },
              builder: (context, state) {
                return Text(
                  "${state.counter}",
                  style: TextStyle(fontSize: 50),
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
                          context.read<CounterCubit>().decrement();
                        },
                        icon: Icon(
                          Icons.remove,
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
                        context.read<CounterCubit>().increment();
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
            ElevatedButton(onPressed: () {
              context.read<CounterCubit>().reset();
            }, child: Text("Reset Counter")),
          ],
        ),
      ),
    );
  }
}
