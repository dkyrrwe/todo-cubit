import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import '../models/todo.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit()
    : super(
        TodoInitial([
          Todo(
            id: UniqueKey().toString(),
            title: "Go home",
            description: "description",
            userId: "1",
            isDone: true,
          ),
          Todo(
            id: UniqueKey().toString(),
            title: "Go shopping",
            description: "description",
            userId: "1",
            isDone: false,
          ),
          Todo(
            id: UniqueKey().toString(),
            title: "Go swimming",
            description: "description",
            userId: "2",
            isDone: false,
          ),
        ]),
      );

  void getTodos() {
    emit(TodoState(todos: state.todos));
  }

  void addTodo(String title) {
    try {
      final todo = Todo(
        id: UniqueKey().toString(),
        title: title,

        userId: "1",
        description: "description",
      );
      final todos = [...state.todos!, todo];

      emit(TodoAdded());
      emit(TodoState(todos: todos));
    } catch (e) {
      emit(TodoError("Error occured"));
    }
  }

  void editTodo(String id, String title) {
    try {
      final todos = state.todos!.map((t) {
        if (t.id == id) {
          return Todo(
            id: id,
            title: title,
            userId: t.userId,
            description: t.description,
            isDone: t.isDone,
          );
        }
        return t;
      }).toList();
      emit(TodoEdited());
      emit(TodoState(todos: todos));
    } catch (e) {
      emit(TodoError("Error occured"));
    }
  }

  void toggleTodo(String id) {
    final todos = state.todos!.map((todo) {
      if (todo.id == id) {
        return Todo(
          id: todo.id,
          title: todo.title,
          userId: todo.userId,
          description: todo.description,
          isDone: !todo.isDone,
        );
      }
      return todo;
    }).toList();
    emit(TodoToggle());
    emit(TodoState(todos: todos));
  }

  void deleteTodo(String id) {
    final todos = state.todos;
    todos!.removeWhere((t) => t.id == id);
    emit(TodoDeleting());
    emit(TodoState(todos: todos));
  }

  List<Todo> searchTodos(String title) {
    return state.todos!
        .where((t) => t.title.toLowerCase().contains(title.toLowerCase()))
        .toList();
  }
}
