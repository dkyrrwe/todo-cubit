import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit/logic/todo/todo_cubit.dart';

class SearchBarDel extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      TextButton(
        onPressed: () {
          query = '';
        },
        child: Text("CLEAR"),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back_ios),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final todos = context.read<TodoCubit>().searchTodos(query);
    return todos.isEmpty
        ? Center(child: Text("Can't fing todos"))
        : ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) =>
                ListTile(title: Text(todos[index].title)),
          );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isNotEmpty) {
      final todos = context.read<TodoCubit>().searchTodos(query);
      return todos.isEmpty
          ? Center(child: Text("Can't fing todos"))
          : ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) =>
                  ListTile(title: Text(todos[index].title)),
            );
    }
    return Container();
  }
}
