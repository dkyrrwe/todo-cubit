import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/search_bar_del.dart';
import '../../logic/todo/todo_cubit.dart';
import '../widgets/manage_todo.dart';
import '../widgets/todo_list_item.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});
  void openManageTodo(BuildContext context) {
    showModalBottomSheet(
      isDismissible: false,
      isScrollControlled: true,
      context: context,
      builder: (context) => ManageTodo(),
    );
  }

  void openSearchBar(BuildContext context) {
    showSearch(context: context, delegate: SearchBarDel());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Todo Cubit'),
        actions: [
          IconButton(
            onPressed: () {
              openSearchBar(context);
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () => openManageTodo(context),
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: BlocBuilder<TodoCubit, TodoState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.todos!.length,
            itemBuilder: (context, index) =>
                TodoListItem(todo: state.todos![index]),
          );
        },
      ),
    );
  }
}
