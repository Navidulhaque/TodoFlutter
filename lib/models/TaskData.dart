import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/tasks.dart';
import 'dart:collection';

class Taskdata extends ChangeNotifier {
  List<Task> _tasks = [];
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get tasklen {
    return _tasks.length;
  }

  void addtask(String title) {
    _tasks.add(Task(name: title));
    notifyListeners();
  }

  void ischecked(Task task) {
    task.toggledone();
    notifyListeners();
  }

  void deletetast(int i) {
    _tasks.removeAt(i);
    notifyListeners();
  }
}
