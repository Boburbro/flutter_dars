part of 'todo_cubit.dart';

@immutable
class TodoState {
  final List<Todo> todos;

  const TodoState(this.todos);
}

final class TodoInitial extends TodoState {
  const TodoInitial(super.todos);
}

final class TodoAdded extends TodoState {
  const TodoAdded(super.todos);
}

final class TodoError extends TodoState {
  final String message;
  const TodoError(this.message, super.todos);
}
