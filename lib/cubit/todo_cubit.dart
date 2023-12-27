import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/models/todo.dart';

class TodoCubit extends Cubit<List<Todo>> {
  TodoCubit() : super([]);

  void addTodo(String title) {
    if (title.isEmpty) {
      addError("Title is Empty");
      return;
    }
    final todo = Todo(
      name: title,
      createdAt: DateTime.now(),
    );

    emit([...state, todo]);
  }

  void removeTodo(DateTime date) {
    for (int i = 0; i < state.length; i++) {
      if (state[i].createdAt == date) {
        state.removeAt(i);
      }
    }
    emit([...state]);
  }

  // void editTodo(DateTime date, String title) {
  //   for (int i = 0; i < state.length; i++) {
  //     if (state[i].createdAt == date) {
  //       state[i].name = title;
  //     }
  //   }
  // }

  @override
  void onChange(Change<List<Todo>> change) {
    // TODO: implement onChange
    super.onChange(change);
    if (kDebugMode) {
      print(change);
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    // TODO: implement onError
    super.onError(error, stackTrace);
    if (kDebugMode) {
      print("$error");
    }
  }
}
