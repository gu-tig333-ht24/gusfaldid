import 'package:flutter/material.dart';
import 'package:template/api.dart';
import 'package:template/main.dart';

class MyState extends ChangeNotifier {
  List _toDoLista = [];

  String _sortBy = 'All';

  List get toDoLista {
    if (_sortBy == 'All') {
      return _toDoLista;
    } else if (_sortBy == 'Done') {
      return _toDoLista.where((todo) => todo.done).toList();
    } else if (_sortBy == 'Undone') {
      return _toDoLista.where((todo) => !todo.done).toList();
    }
    return _toDoLista;
  }

  Future<void> fetchTodos() async {
    List<ToDo> todos = await getTodosFromAPI();
    _toDoLista = todos;
    notifyListeners();
  }

  void addToList(String text, var id, var done) {
    ToDo(text, id, done);
    _toDoLista.add(ToDo(text, id, done));
    notifyListeners();
  }

  void setSortBy(String value) {
    _sortBy = value;
    notifyListeners();
  }

  void setBool(ToDo todo) {
    todo.done = !todo.done;
    notifyListeners();
  }

  void deleteToDo(ToDo todo) {
    _toDoLista.remove(todo);
    notifyListeners();
  }
}
