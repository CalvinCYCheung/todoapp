import 'package:app/model/to_do_model.dart';
import 'package:flutter/material.dart';

class ToDoListTile extends StatefulWidget {
  const ToDoListTile({Key? key, required this.toDoModel}) : super(key: key);
  final ToDoModel toDoModel;

  @override
  _ToDoListTileState createState() => _ToDoListTileState();
}

class _ToDoListTileState extends State<ToDoListTile> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: checked
          ? const Icon(Icons.check_box_outlined)
          : const Icon(Icons.check_box_outline_blank),
      title: Text(
        widget.toDoModel.title,
        style: TextStyle(
          decoration:
              checked ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      subtitle: Text(
        widget.toDoModel.content,
        style: TextStyle(
          decoration:
              checked ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      onTap: () {
        setState(() {
          checked ? checked = false : checked = true;
        });
      },
    );
  }
}
