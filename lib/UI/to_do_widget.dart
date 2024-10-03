// Kod som bygger en instansa av todowidgeten, anropas i homepage koden.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/My_state.dart';
import 'package:template/UI/change_todo_page.dart';
import 'package:template/to_do.dart';

class ToDoWidget extends StatelessWidget {
  final ToDo todo;
  const ToDoWidget(this.todo, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ChangeTodoPage(todo)));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Checkbox(
                  value: todo.done,
                  onChanged: (bool? value) {
                    context.read<MyState>().setBool(todo);
                  },
                ),
              ),
              Expanded(
                child: Text(
                  todo.title,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              GestureDetector(
                onTap: () {
                  context.read<MyState>().deleteToDo(todo);
                },
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Icon(Icons.close),
                ),
              ),
            ],
          ),
          Container(
            height: 1,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
