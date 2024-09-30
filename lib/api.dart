import 'package:http/http.dart' as http;
import 'package:template/Todo_class.dart';
import 'dart:convert';

const String ENDPOINT = 'https://todoapp-api.apps.k8s.gu.se';

const String APIKey = '4e7314a5-9ab3-4e4d-9149-bfd4d2e7e1a5';

Future<List<ToDo>> getTodosFromAPI() async {
  http.Response response =
      await http.get(Uri.parse('$ENDPOINT/todos?key=$APIKey'));
  String body = response.body;
  List<dynamic> jsonResponse = jsonDecode(body);

  List<ToDo> todos =
      jsonResponse.map((jsonItem) => ToDo.fromJson(jsonItem)).toList();
  return todos;
}

Future<void> postTodoAPI(String title) async {
  await http.post(
    Uri.parse('$ENDPOINT/todos?key=$APIKey'),
    headers: {"Content-Type": "application/json"},
    body: jsonEncode({"title": "$title", "done": false}),
  );
}

Future<void> deleteTodoFromAPI(ToDo todo) async {
  var key = todo.id;
  await http.delete(Uri.parse('$ENDPOINT/todos/$key?key=$APIKey'));
}

Future<void> changeTodoAPI(ToDo todo) async {
  var done = todo.done;
  var key = todo.id;
  var title = todo.title;
  await http.put(Uri.parse('$ENDPOINT/todos/$key?key=$APIKey'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"title": title, "done": done}));
}
