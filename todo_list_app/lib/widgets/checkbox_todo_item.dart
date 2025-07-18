import 'package:flutter/material.dart';
import 'package:todo_list_app/models/todo.dart';

class CheckboxTodoItem extends StatefulWidget {
  const CheckboxTodoItem(this.text, this.priority, {super.key});

  final String text;
  final Priority priority;

  @override
  State<CheckboxTodoItem> createState() => _CheckboxTodoItemState();
}

class _CheckboxTodoItemState extends State<CheckboxTodoItem> {
  var _done = false;

  void _setDone(bool? isChecked) {
    setState(() {
      _done = isChecked ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var icon = Icons.low_priority;

    if (widget.priority == Priority.urgent) {
      icon = Icons.notifications_active;
    }

    if (widget.priority == Priority.normal) {
      icon = Icons.list;
    }

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Checkbox(value: _done, onChanged: _setDone),
          const SizedBox(width: 6),
          Icon(icon),
          const SizedBox(width: 12),
          Text(widget.text),
        ],
      ),
    );
  }
}