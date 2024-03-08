import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../data/models/todo.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit()
      : super(TodoInitial([
          Todo(id: UniqueKey().toString(), title: "Go home"),
          Todo(id: UniqueKey().toString(), title: "Go shopping"),
          Todo(id: UniqueKey().toString(), title: "Go school"),
        ]));

  void addTodo(title) {
    try {
      state.todos.add(Todo(id: UniqueKey().toString(), title: title));
      emit(TodoState(state.todos));
      emit(TodoAdded(state.todos));
    } catch (e) {
      emit(TodoError("Error occured!", state.todos));
    }
  }
}
