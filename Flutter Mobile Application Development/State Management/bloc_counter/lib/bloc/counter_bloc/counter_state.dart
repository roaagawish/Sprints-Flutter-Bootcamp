part of 'counter_bloc.dart';

@immutable
abstract class CounterState {
 final int counter ;
 const CounterState({required this.counter });
}

class CounterInitial extends CounterState {
  const CounterInitial({required super.counter});
  

}
