import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/todo/todo_cubit.dart';
import '../widgets/manageTodo.dart';
import '../widgets/search_bar.dart';
import '../widgets/todo_list_item.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  var isinitialized = false;

  @override
  void didChangeDependencies() {
    if (!isinitialized) {
      context.read<TodoCubit>().getTodos();
      isinitialized = true;
    }
    super.didChangeDependencies();
  }

  void openSearchBar(BuildContext context) {
    showSearch(context: context, delegate: MySearchBar());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TodoScrees"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => openSearchBar(context),
              icon: const Icon(Icons.search_rounded)),
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
