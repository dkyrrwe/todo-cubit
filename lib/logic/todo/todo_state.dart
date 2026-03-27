part of 'todo_cubit.dart';

@immutable
class TodoState {
  final List<Todo>? todos;
  const TodoState({this.todos});
}

final class TodoInitial extends TodoState {
  @override
  // ignore: overridden_fields
  final List<Todo> todos;
  const TodoInitial(this.todos) : super();
}

class TodoAdded extends TodoState {}

class TodoEdited extends TodoState {}

class TodoToggle extends TodoState {}

class TodoDeleting extends TodoState {}

class TodoError extends TodoState {
  final String message;
  const TodoError(this.message);
}
