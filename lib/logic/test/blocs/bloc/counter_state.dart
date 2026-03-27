part of 'counter_bloc.dart';

@immutable
sealed class CounterState {
  final int number;
  CounterState(this.number);
}

final class CounterInitial extends CounterState {
  CounterInitial(super.number);
}

class CounterLoading extends CounterState {
  CounterLoading(super.number);
}

class CounterCounted extends CounterState {
  final int count;
  CounterCounted(this.count) : super(count);
}

class CounterError extends CounterState {
  final String message;
  CounterError(this.message, super.number);
}
