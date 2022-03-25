import 'package:flutter/material.dart';
import 'package:taskmanagementapp/widgets/mainpage/bottom_strip.dart';
import 'package:taskmanagementapp/widgets/mainpage/motivation.dart';
import 'package:taskmanagementapp/widgets/mainpage/task_categories.dart';
import 'package:taskmanagementapp/widgets/mainpage/tasks_container.dart';
import 'package:taskmanagementapp/widgets/mainpage/welcome.dart';

class MainPageContent extends StatefulWidget {
  const MainPageContent({Key? key}) : super(key: key);

  @override
  State<MainPageContent> createState() => _MainPageContentState();
}

class _MainPageContentState extends State<MainPageContent> {
  int selectedCategory = 0;
  int tappedBottomIndex = 0;

  void changeSelectedCategory(int tappedCategory) {
    setState(() {
      selectedCategory = tappedCategory;
    });
  }

  void updateMainPageContent({required int tappedBottomButton}) {
    setState(() {
      tappedBottomIndex = tappedBottomButton;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ////below widget holds the reference to the welcoming text + profile icon
        ///it is called welcome.dart
        const Padding(
          padding: EdgeInsets.fromLTRB(30, 30, 30, 20),
          child: WelcomeText(),
        ),

        ////motivation strip widget
        const Padding(
          padding: EdgeInsets.fromLTRB(30, 30, 30, 20),
          child: Motivation(),
        ),

        ///categories strip widget
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Categories(notifyCategory: changeSelectedCategory),
        ),

        ///Reminders container.. below container holds the data of all reminders
        ///the reminder state changes with either selected Reminder category OR
        ///tapped Bottom Index;
        TasksContainer(
          tappedCategoryIndex: selectedCategory,
          tappedBottomIndex: tappedBottomIndex,
        ),

        ////bottom container that holds info whether to populate the task
        ///container with all reminders, or today's tasks
        BottomStrip(
          updateStateofParent: updateMainPageContent,
          tappedBottomIndex: tappedBottomIndex,
        ),
      ],
    );
  }
}
