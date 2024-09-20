// ignore_for_file: prefer_const_constructors

// Steg 2 vilkorshantering

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:template/add_to_do_page.dart';
import 'package:template/to_do_widget.dart';

class MyState extends ChangeNotifier {
  final List _toDoLista = [];

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

  void addToList(String text) {
    ToDo(text);
    _toDoLista.add(ToDo(text));
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

void main() {
  MyState state = MyState();
  runApp(
    ChangeNotifierProvider(
      create: (context) => state,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Idas to do list',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'To do list'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ToDo {
  String toDoText;
  bool done = false;

  ToDo(this.toDoText);
}

//Här är koden för förstasidan

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var todos = context.watch<MyState>().toDoLista;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          PopupMenuButton(
            onSelected: (String result) {
              context.read<MyState>().setSortBy(result);
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem(value: 'All', child: Text('All')),
              const PopupMenuItem<String>(
                value: 'Done',
                child: Text('Done'),
              ),
              const PopupMenuItem(value: 'Undone', child: Text('Undone')),
            ],
          ),
        ],
      ),
      body: ListView(
        children: todos.map((todo) => ToDoWidget(todo)).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddToDoPage()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
