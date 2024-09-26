// ignore_for_file: prefer_const_constructors

// Steg 2 vilkorshantering

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/My_state.dart';
import 'package:template/UI/My_home_page.dart';

class ToDo {
  String? id;
  String title;
  bool done = false;

  ToDo({this.id, required this.title, this.done = false});

  factory ToDo.fromJson(Map<String, dynamic> json) {
    return ToDo(id: json['id'], title: json['title'], done: json['done']);
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
