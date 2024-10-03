import 'package:flutter/material.dart';
import 'package:template/to_do.dart';
import 'package:template/api.dart';

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

  void setSortBy(String value) {
    _sortBy = value;
    notifyListeners();
  }

  MyState() {
    fetchTodos();
  }

  Future<void> fetchTodos() async {
    List<ToDo> todos =
        await getTodosFromAPI(); //ska denna egentligen ligga som funktion utanför?
    _toDoLista = todos; //och så skapar jag en konstruktor som hämtar det?
    notifyListeners();
  }

  Future<void> addToDo(String text) async {
    await postTodoAPI(text);
    fetchTodos();
  }

  Future<void> deleteToDo(ToDo todo) async {
    await deleteTodoFromAPI(todo);
    fetchTodos();
  }

  Future<void> setBool(ToDo todo) async {
    todo.done = !todo.done;
    await changeTodoAPI(todo);
    fetchTodos();
  }

  Future<void> changeTodo(todo) async {
    await changeTodoAPI(todo);
    fetchTodos();
  }
}
