import 'package:flutter/material.dart';
import 'Task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/TaskData.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Taskdata>(
      builder: (context, taskdata, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTile(
              ischecked: taskdata.tasks[index].isDone,
              title: taskdata.tasks[index].name,
              checkboxstatecallback: (bool checkboxstate) {
                taskdata.ischecked(taskdata.tasks[index]);
              },
              onlongpresscallback: () {
                taskdata.deletetast(index);
              },
            );
          },
          itemCount: taskdata.tasklen,
        );
      },
    );
  }
}
