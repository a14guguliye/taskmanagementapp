import 'package:flutter/material.dart';
import 'package:taskmanagementapp/models/reminder.dart';
import 'package:taskmanagementapp/widgets/tasks/update_task_form.dart';
import 'package:taskmanagementapp/widgets/tasks/update_task_strip.dart';

////the purpose of this screen is to indicate 2 widget.
///1st widget will be new strip
///2nd widget will be update form
class UpdateTask extends StatelessWidget {
  final Reminder tappedReminder;
  const UpdateTask({Key? key, required this.tappedReminder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Center(child: Text('Notifications Details')),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: <Widget>[
              const UpdateTaskStrip(),
              UpdateTaskForm(
                passedReminder: tappedReminder,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
