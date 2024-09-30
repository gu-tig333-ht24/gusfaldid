import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/My_state.dart';
import 'package:template/Todo_class.dart';

// ignore: must_be_immutable
class ChangeTodoPage extends StatelessWidget {
  final ToDo todo;
  String newToDoText = '';

  ChangeTodoPage(this.todo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Change ToDo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'What do you want to change to?',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
              onChanged: (text) {
                newToDoText = text;
              },
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  todo.title = newToDoText;
                  context.read<MyState>().changeTodo(todo);
                  Navigator.pop(context);
                },
                child: Text(
                  'Change Todo',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
