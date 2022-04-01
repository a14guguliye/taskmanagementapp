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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: const <Widget>[
              SizedBox(
                height: 50,
              ),
              NewTaskStrip(),
              NewTaskForm(),
            ],
          ),
        ),
      ),
    );
  }
}
