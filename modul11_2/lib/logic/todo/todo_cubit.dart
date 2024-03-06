import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../data/models/todo.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit()
      : super(
          TodoInitial(
            [
              Todo(id: UniqueKey().toString(), title: "Go home"),
              Todo(id: UniqueKey().toString(), title: "Go shopping"),
              Todo(id: UniqueKey().toString(), title: "Go school"),
            ],
          ),
        );
}
