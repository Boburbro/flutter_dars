import 'package:flutter/material.dart';

import '../../data/models/todo.dart';

class ToDoListItem extends StatelessWidget {
  const ToDoListItem({required this.todo, super.key});

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ListTile(
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              todo.isDone
                  ? Icons.check_circle_outline_rounded
                  : Icons.circle_outlined,
              color: todo.isDone ? Colors.green : Colors.grey,
            ),
          ),
          title: Text(todo.title),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.edit_rounded),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.delete_forever_rounded,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
