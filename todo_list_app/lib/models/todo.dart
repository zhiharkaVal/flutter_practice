enum Priority { urgent, normal, low }

class Todo {
  const Todo(this.text, this.priority);

  final String text;
  final Priority priority;
}