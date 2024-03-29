import 'package:flutter/material.dart';

import '../model/todo_model.dart';

class TodoProvider extends ChangeNotifier {
  final List<TodoModel> _todo = [];

  List<TodoModel> get todos => _todo;

  void addTodo(TodoModel todo)  {
    _todo.add(todo);
    notifyListeners();
  }

  void toggleTodoCompletion(int index) {
    _todo[index] = TodoModel(
      title: _todo[index].title,
      isCompleted: !_todo[index].isCompleted,
    );
    notifyListeners();
  }

  void removeTodo(TodoModel todo)  {
    _todo.remove(todo);
    notifyListeners();
  }
}
