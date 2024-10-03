class ToDo {
  String? id;
  String title;
  bool done = false;

  ToDo({this.id, required this.title, this.done = false});

  factory ToDo.fromJson(Map<String, dynamic> json) {
    return ToDo(id: json['id'], title: json['title'], done: json['done']);
  }
}
