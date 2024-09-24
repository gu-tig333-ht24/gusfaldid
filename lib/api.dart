import 'package:http/http.dart' as http;
import 'dart:convert';

const String ENDPOINT = 'https://todoapp-api.apps.k8s.gu.se';

const String APIKey = '4e7314a5-9ab3-4e4d-9149-bfd4d2e7e1a5';

class ToDo {
  String id;
  String title;
  bool done = false;

  ToDo(this.id, this.title, this.done);
}

Future<List<ToDo>> getTodosFromAPI() async {
  print('making request');
  http.Response response =
      await http.get(Uri.parse('$ENDPOINT/todos?key=$APIKey'));
  String body = response.body;
  print(body);
  return [];
}

void postTodoAPI(String title) async {
  await http.post(
    Uri.parse('$ENDPOINT/todos?key=$APIKey'),
    headers: {"Content-Type": "application/json"},
    body: jsonEncode({"title": "$title", "done": false}),
  );
  print('todo posted!!');
}
