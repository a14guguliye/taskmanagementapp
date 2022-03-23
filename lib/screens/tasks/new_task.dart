import 'package:flutter/material.dart';
import 'package:taskmanagementapp/widgets/tasks/new_task_form.dart';
import 'package:taskmanagementapp/widgets/tasks/new_task_strip.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: const Color(0xFF242A3E),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(35),
          child: Column(
            children: const <Widget>[
              NewTaskStrip(),
              NewTaskForm(),
            ],
          ),
        ),
      ),
    );
  }
}
