import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterInitial(0)) {
    on<CounterEvent>((event, emit) async {
      emit(CounterLoading(state.number));
        await Future.delayed(const Duration(seconds: 1));


      if (event is CounterIncrementEvent) {
        emit(CounterCounted(state.number + 1));
      } else if (event is CounterDecrementEvent) {
        emit(CounterCounted(state.number - 1));
      }
    });
  }
}
