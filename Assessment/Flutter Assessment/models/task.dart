import 'dart:convert';

class Task {
  String id;
  String title;
  String description;
  bool done;

  Task({
    required this.id,
    required this.title,
    required this.description,
    this.done = false,
  });

  factory Task.fromMap(Map<String, dynamic> m) => Task(
        id: m['id'] as String,
        title: m['title'] as String,
        description: m['description'] as String,
        done: m['done'] as bool,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'description': description,
        'done': done,
      };

  String toJson() => jsonEncode(toMap());

  factory Task.fromJson(String s) => Task.fromMap(jsonDecode(s));
}
