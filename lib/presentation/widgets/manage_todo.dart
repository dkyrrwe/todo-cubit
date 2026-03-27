import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/models/todo.dart';
import '../../logic/todo/todo_cubit.dart';

// ignore: must_be_immutable
class ManageTodo extends StatefulWidget {
  final Todo? todo;
  const ManageTodo({super.key, this.todo});

  @override
  State<ManageTodo> createState() => _ManageTodoState();
}

class _ManageTodoState extends State<ManageTodo> {
  final _formkey = GlobalKey<FormState>();

  String _title = '';

  void _submit() {
    if (_formkey.currentState!.validate()) {
      _formkey.currentState!.save();
      if (widget.todo == null) {
        // BlocProvider.of<TodoCubit>(context).addTodo(_title);
        context.read<TodoCubit>().addTodo(_title);
      } else {
        // BlocProvider.of<TodoCubit>(context).editTodo(
        //   Todo(
        //     id: widget.todo!.id,
        //     title: _title,
        //     description: widget.todo!.description,
        //     isDone: widget.todo!.isDone,
        //   ),
        // );
        context.read<TodoCubit>().editTodo(widget.todo!.id, widget.todo!.title);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final todo = widget.todo;
    return BlocListener<TodoCubit, TodoState>(
      listener: (context, state) {
        // ignore: unrelated_type_equality_checks
        if (state is TodoAdded || state is TodoEdited) {
          Navigator.of(context).pop();
        } else if (state is TodoError) {
          showDialog(
            context: context,
            builder: (context) =>
                AlertDialog(title: Text("Error"), content: Text(state.message)),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          width: double.infinity,
          height: 500,
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),

                    labelText: "Title",
                  ),
                  initialValue: todo == null ? "" : todo.title,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please , enter title";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _title = value!;
                  },
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Cancel"),
                    ),
                    ElevatedButton(
                      onPressed: _submit,
                      child: todo == null ? Text("Add") : Text("Edit"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
