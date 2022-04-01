import 'package:flutter/material.dart';
import 'package:taskmanagementapp/models/reminder.dart';
import 'package:taskmanagementapp/screens/tasks/taskdetail.dart';
import 'package:taskmanagementapp/services/firebase_store.dart';

class TasksContainer extends StatefulWidget {
  final int tappedCategoryIndex;
  final int tappedBottomIndex;
  const TasksContainer(
      {Key? key,
      required this.tappedCategoryIndex,
      required this.tappedBottomIndex})
      : super(key: key);

  @override
  State<TasksContainer> createState() => _TasksContainerState();
}

class _TasksContainerState extends State<TasksContainer> {
  FireStoreDatabase fs = FireStoreDatabase();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Iterable<Reminder>>(
        future: fs.getMeReminders(
            widget.tappedCategoryIndex, widget.tappedBottomIndex),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const SizedBox(child: Text("Error happened"));
          }
          if (snapshot.hasData == false) {
            return const SizedBox(child: Text("Document does not exist"));
          }

          if (snapshot.hasData) {
            return Expanded(
                child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      Reminder r = snapshot.data!.elementAt(index);
                      String dateDifference = r.reminderDate!
                          .difference(DateTime.now())
                          .inDays
                          .toString();
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 30, right: 30, top: 10, bottom: 10),
                        child: Dismissible(
                          key: UniqueKey(),
                          direction: DismissDirection.endToStart,
                          onDismissed: (direction) async {
                            await fs.delete(r.id.toString());
                          },
                          background: Container(
                            color: Colors.amber,
                          ),
                          child: GestureDetector(
                            onDoubleTap: () async {
                              await fs.snoozeReminder(remindertoBeSnoozed: r);
                              setState(() {});
                            },
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              decoration: const BoxDecoration(
                                  color: Color(0xFFEBF3FF),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              child: Row(
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (builder) {
                                        return UpdateTask(
                                          tappedReminder: r,
                                        );
                                      }));
                                    },
                                    child: Container(
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
                                  ),
                                  Expanded(
                                      child: Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(15, 0, 0, 0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          r.description?.toString() ?? "",
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  )),
                                  Column(
                                    children: <Widget>[
                                      const Text(
                                        "Days Rem:",
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
                          ),
                        ),
                      );
                    }));
          }
          return const Text("Loading");
        });
  }
}
