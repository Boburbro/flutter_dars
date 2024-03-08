import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/todo/todo_cubit.dart';
import '../widgets/manageTodo.dart';
import '../widgets/todo_list_item.dart';

class ToDoScreen extends StatelessWidget {
  const ToDoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TodoScrees"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => showModalBottomSheet(
              isDismissible: false,
              context: context,
              builder: (ctx) => const ManageTodo(),
            ),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: BlocBuilder<TodoCubit, TodoState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: state.todos.length,
              itemBuilder: (ctx, index) => ToDoListItem(
                todo: state.todos[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
