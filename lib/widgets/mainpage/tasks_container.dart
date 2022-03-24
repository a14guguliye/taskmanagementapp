import 'package:flutter/material.dart';
import 'package:taskmanagementapp/models/reminder.dart';
import 'package:taskmanagementapp/services/firebase_store.dart';

class TasksContainer extends StatefulWidget {
  final int tappedCategoryIndex;
  const TasksContainer({Key? key, required this.tappedCategoryIndex})
      : super(key: key);

  @override
  State<TasksContainer> createState() => _TasksContainerState();
}

class _TasksContainerState extends State<TasksContainer> {
  FireStoreDatabase fs = FireStoreDatabase();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Iterable<Reminder>>(
        future: fs.getMeReminders(widget.tappedCategoryIndex),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("Error happened");
          }
          if (snapshot.hasData == false) {
            return const Text("Document does not exist");
          }

          if (snapshot.hasData) {
            return Expanded(
                child: GestureDetector(
              onVerticalDragDown: ((details) {
                print("i am rebuilding");
                setState(() {});
              }),
              child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    Reminder r = snapshot.data!.elementAt(index);
                    String dateDifference = DateTime.now()
                        .difference(r.entryDate)
                        .inDays
                        .toString();
                    return Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                            color: Color(0xFFEBF3FF),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        child: Row(
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(30)),
                                  border: Border.all(
                                      width: 1, color: Colors.white)),
                              child: const Icon(
                                Icons.alarm,
                                size: 30,
                                color: Color(0xFFFF4500),
                              ),
                            ),
                            Expanded(
                                child: Container(
                              padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "ID:" "${r.id.toString()}",
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'BU:'
                                    "${r.businessUnit.toString()}",
                                    style: const TextStyle(
                                        color: Color(0xFF657386),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Type:'
                                    "${r.reminderType.toString()}",
                                    style: const TextStyle(
                                        color: Color(0xFF657386),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            )),
                            Column(
                              children: <Widget>[
                                const Text(
                                  "Days Left:",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(dateDifference,
                                    style: const TextStyle(
                                        color: Color(0xFF657386),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ));
          }
          return const Text("Loading");
        });
  }
}
