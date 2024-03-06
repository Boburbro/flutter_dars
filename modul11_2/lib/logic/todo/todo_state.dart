part of 'todo_cubit.dart';

@immutable
sealed class TodoState {
  final List<Todo> todos;

  const TodoState(this.todos);
}

final class TodoInitial extends TodoState {
  final List<Todo> todos;

  const TodoInitial(this.todos) : super(todos);
}
