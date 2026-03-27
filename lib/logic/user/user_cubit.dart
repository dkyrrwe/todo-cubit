import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:todo_cubit/logic/models/user.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial(User(name: "Alex", id: "1")));
}
