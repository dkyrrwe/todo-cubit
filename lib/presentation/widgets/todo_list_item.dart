import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit/logic/todo/todo_cubit.dart';
import '../../logic/models/todo.dart';
import 'manage_todo.dart';

class TodoListItem extends StatelessWidget {
  final Todo todo;
  const TodoListItem({super.key, required this.todo});
  void openManageTodo(BuildContext context) {
    showModalBottomSheet(
      isDismissible: false,
      isScrollControlled: true,
      context: context,
      builder: (context) => ManageTodo(todo: todo),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        todo.title,
        style: TextStyle(
          decoration: todo.isDone
              ? TextDecoration.lineThrough
              : TextDecoration.none,
        ),
      ),
      leading: IconButton(
        onPressed: () => context.read<TodoCubit>().toggleTodo(todo.id),
        icon: Icon(
          todo.isDone ? Icons.check_circle_rounded : Icons.circle_outlined,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () => context.read<TodoCubit>().deleteTodo(todo.id),
            icon: Icon(Icons.delete),
          ),
          IconButton(
            onPressed: () => openManageTodo(context),
            icon: Icon(Icons.edit),
          ),
        ],
      ),
    );
  }
}
