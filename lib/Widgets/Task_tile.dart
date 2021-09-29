import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool ischecked;
  final String title;
  final Function checkboxstatecallback;
  final Function onlongpresscallback;
  TaskTile(
      {this.ischecked,
      this.title,
      this.checkboxstatecallback,
      this.onlongpresscallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: onlongpresscallback,
      title: Text(
        title,
        style: TextStyle(
          decoration: ischecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: ischecked,
        onChanged: checkboxstatecallback,
      ),
    );
  }
}
