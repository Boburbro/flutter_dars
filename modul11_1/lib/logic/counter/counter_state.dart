abstract class CounterState {
  final int number;

  CounterState(this.number);
}

class CounterInitila extends CounterState {
  CounterInitila(super.number);
}

class CounterLoading extends CounterState {
  CounterLoading(super.number);
}

class CounterCounted extends CounterState {
  final int counter;

  CounterCounted(this.counter) : super(counter);
}

class CounterError extends CounterState {
  final String message;
  CounterError(this.message, number) : super(number);
}
