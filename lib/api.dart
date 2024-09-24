import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:template/main.dart';

const String ENDPOINT = 'https://todoapp-api.apps.k8s.gu.se';

const String APIKey = '4e7314a5-9ab3-4e4d-9149-bfd4d2e7e1a5';

Future<List<ToDo>> getTodosFromAPI() async {
  print('making request');
  http.Response response =
      await http.get(Uri.parse('$ENDPOINT/todos?key=$APIKey'));
  String body = response.body;
  print(body);
  List<dynamic> jsonResponse = jsonDecode(body);

  List<ToDo> todos =
      jsonResponse.map((jsonItem) => ToDo.fromJson(jsonItem)).toList();
  print(todos);
  return todos;
}

void postTodoAPI(String title) async {
  await http.post(
    Uri.parse('$ENDPOINT/todos?key=$APIKey'),
    headers: {"Content-Type": "application/json"},
    body: jsonEncode({"title": "$title", "done": false}),
  );
  print('todo posted!!');
}

void deleteTodoFromAPI() async {
  var key = "3f330884-eda6-4338-a8ad-2f876a77230e";
  await http.delete(Uri.parse('$ENDPOINT/todos/$key?key=$APIKey'));
  print('todo deleted');
}

void changeTodoAPI() async {
  var done = true;
  var key = "1ed519b0-495a-408c-b57e-dbd4eb023086";
  var title = "Hejsanhoppsan";
  await http.put(Uri.parse('$ENDPOINT/todos/$key?key=$APIKey'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"title": "$title", "done": done}));
  print('todo ändrad!');
}
