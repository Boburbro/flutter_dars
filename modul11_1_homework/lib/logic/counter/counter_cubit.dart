import 'package:bloc/bloc.dart';
import '/logic/counter/counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitila(0));

  void increase() async {
    emit(CounterLoading(state.number));
    await Future.delayed(const Duration(seconds: 5));
    emit(CounterError("ERROR", state.number));
    await Future.delayed(const Duration(seconds: 1));
    emit(CounterCounted(state.number + 1));
  }

  void decrease() async {
    emit(CounterLoading(state.number));
    await Future.delayed(const Duration(seconds: 5));
    emit(CounterCounted(state.number - 1));
  }
}
