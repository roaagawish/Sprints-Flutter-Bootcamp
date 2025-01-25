import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial(counter: 0)) {
 
    on<IncrementCounter> ((event, emit) {
      emit(CounterInitial(counter:state.counter + 1 ));
    });

    on<DecrementCounter> ((event, emit) {
      emit(CounterInitial(counter:state.counter - 1 ));
    });

    on<ResetCounter> ((event, emit) {
      emit(CounterInitial(counter: 0 ));
    });
  }
}
