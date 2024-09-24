//Här är koden för förstasidan

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/My_state.dart';
import 'package:template/UI/add_to_do_page.dart';
import 'package:template/UI/to_do_widget.dart';

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
