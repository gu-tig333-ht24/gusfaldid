import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/My_state.dart';

class AddToDoPage extends StatefulWidget {
  const AddToDoPage({super.key});

  @override
  State<AddToDoPage> createState() => _AddToDoPageState();
}

class _AddToDoPageState extends State<AddToDoPage> {
  late String newToDo;

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
            padding: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Vad ska du göra?',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder()),
              onChanged: (text) {
                newToDo = text;
              },
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                context.read<MyState>().addToList("0123", newToDo, false);
                Navigator.pop(context);
              },
              child: Text('Lägg till'),
            ),
          ),
        ],
      ),
    );
  }
}
