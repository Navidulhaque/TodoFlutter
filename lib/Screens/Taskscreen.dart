import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/TaskData.dart';

class AddTaskscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String Taskname;
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Add Task",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                color: Colors.lightBlueAccent,
              ),
            ),
            TextField(
              autofocus: true,
              cursorColor: Colors.black,
              textAlign: TextAlign.center,
              decoration: InputDecoration(),
              onChanged: (value) {
                Taskname = value;
              },
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Provider.of<Taskdata>(context, listen: false).addtask(Taskname);
                Navigator.pop(context);
              },
              child: Text("Add Task"),
              style: ElevatedButton.styleFrom(
                primary: Colors.lightBlueAccent,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
            )
          ],
        ),
      ),
    );
  }
}
