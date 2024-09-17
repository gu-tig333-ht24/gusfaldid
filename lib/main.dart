// ignore_for_file: prefer_const_constructors

// Steg 1 UI

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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
  final String toDoText;

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
    List<ToDo> todos = [
      ToDo('käka mat'),
      ToDo('Pluggga'),
      ToDo('Koda'),
      ToDo('sova'),
      ToDo('käka mat'),
      ToDo('Pluggga'),
      ToDo('Koda'),
      ToDo('sova'),
      ToDo('käka mat'),
      ToDo('Pluggga'),
      ToDo('Koda'),
      ToDo('sova')
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
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

// här är koden för den sidan där man ska kunna lägga till nya ToDos

class AddToDoPage extends StatelessWidget {
  const AddToDoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(backgroundColor: Theme.of(context).colorScheme.inversePrimary),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white, border: Border.all(color: Colors.black)),
              child: Center(
                child: Text(
                  'What are you going to do?',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ),
          Center(child: Text('ADD +')),
        ],
      ),
    );
  }
}

// Kod som bygger en instansa av todowidgeten, anropas i homepage koden.

class ToDoWidget extends StatelessWidget {
  final ToDo todo;
  const ToDoWidget(this.todo, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black)),
              ),
            ),
            Expanded(
              child: Text(
                todo.toDoText,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Icon(Icons.close),
            )
          ],
        ),
        Container(
          height: 1,
          color: Colors.grey,
        )
      ],
    );
  }
}
