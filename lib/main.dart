import 'package:flutter/material.dart';
import 'Screens/Screens.dart';
import 'package:provider/provider.dart';
import 'models/TaskData.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Taskdata(),
      child: MaterialApp(
        home: Taskscreen(),
      ),
    );
  }
}
