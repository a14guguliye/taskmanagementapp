import 'package:flutter/material.dart';
import 'package:taskmanagementapp/widgets/tasks/new_task.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: const Color(0xFF242A3E),
      ),
      body: Column(
        children: const <Widget>[
          NewTaskStrip(),
        ],
      ),
    );
  }
}
