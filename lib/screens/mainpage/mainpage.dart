import 'package:flutter/material.dart';
import 'package:taskmanagementapp/screens/tasks/new_task.dart';
import 'package:taskmanagementapp/widgets/mainpage/main_page_content.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("hello, i am building a");
    return LayoutBuilder(builder: (context, constraints) {
      return SafeArea(
        child: Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Container(
            decoration: const BoxDecoration(shape: BoxShape.circle, boxShadow: [
              BoxShadow(
                color: Color(0xFFEAF2FF),
                spreadRadius: 4,
                blurRadius: 4,
                offset: Offset(0, 0),
              ),
            ]),
            width: 65,
            height: 65,
            child: FloatingActionButton(
              elevation: 10,
              backgroundColor: Colors.white,
              foregroundColor: const Color(0xFF122ADC),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TaskScreen()));
              },
              child: const Icon(
                Icons.add,
                size: 34,
              ),
            ),
          ),
          body: SizedBox(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            child: const MainPageContent(),
          ),
        ),
      );
    });
  }
}
