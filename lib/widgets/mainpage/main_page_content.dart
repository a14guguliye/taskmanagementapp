import 'package:flutter/material.dart';
import 'package:taskmanagementapp/models/reminder.dart';
import 'package:taskmanagementapp/services/firebase_store.dart';
import 'package:taskmanagementapp/widgets/mainpage/motivation.dart';
import 'package:taskmanagementapp/widgets/mainpage/task_categories.dart';
import 'package:taskmanagementapp/widgets/mainpage/welcome.dart';

class MainPageContent extends StatefulWidget {
  const MainPageContent({Key? key}) : super(key: key);

  @override
  State<MainPageContent> createState() => _MainPageContentState();
}

class _MainPageContentState extends State<MainPageContent> {
  int selectedCategory = 0;
  FireStoreDatabase fs = FireStoreDatabase();

  void changeSelectedCategory(int tappedCategory) {
    setState(() {
      selectedCategory = tappedCategory;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ////below widget holds the reference to the welcoming text + profile icon
          ///it is called welcome.dart
          const WelcomeText(),

          const SizedBox(
            height: 10,
          ),
          ////motivation strip widget
          const Motivation(),

          const SizedBox(
            height: 20,
          ),

          ///categories strip widget
          Categories(notifyCategory: changeSelectedCategory),

          /*ElevatedButton(
              onPressed: () {
                print(fs.getMeReminders());
              },
              child: Text("Hello")),*/
          FutureBuilder<Iterable<Reminder>>(
              future: fs.getMeReminders(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Text("Error happened");
                }
                if (snapshot.hasData == false) {
                  return const Text("Document does not exist");
                }

                if (snapshot.hasData) {
                  return Expanded(
                      child: ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return Text(snapshot.data!
                                .elementAt(index)
                                .businessUnit
                                .toString());
                          }));
                }
                return const Text("Loading");
              }),
        ],
      ),
    );
  }
}
