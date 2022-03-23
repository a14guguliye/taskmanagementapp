import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:taskmanagementapp/models/reminder.dart';
import 'package:taskmanagementapp/services/firebase_store.dart';

List<String> bu = ['-', 'PRM', 'ISV', 'FC', 'MULTIBU'];
List<String> taskTypes = ['-', 'MRO', 'LEAD', 'PROJECT'];
List<String> sendMeReminder = ['1', '2', '3', '4'];

class NewTaskForm extends StatefulWidget {
  const NewTaskForm({Key? key}) : super(key: key);

  @override
  State<NewTaskForm> createState() => _NewTaskFormState();
}

class _NewTaskFormState extends State<NewTaskForm> {
  ///Below variable will hold the selected bu value for the reminder object
  ///and it will be updated with the controller text of Bu textinput
  String _selectedBuValue = bu[0].toString();

  ////Below variable will hold the selected task type whether it is MRO TASK, or
  ///lead, or project, whatever. That value will be updated as per value coming
  ///out of controller of task value textinput
  String selectedTaskValue = taskTypes[0].toString();

  ///Reminder category will hold a value that will tell me the period where the reminder
  ///should be send as per. For example, if it is 1, the reminder should be sent every day
  ///or 2, reminder should be sent every 2 days, or 3---reminder should be sent in every
  ///3day
  String _reminderCategory = sendMeReminder[2];

  final TextEditingController _reminderId = TextEditingController();
  final TextEditingController _entryDate = TextEditingController();

  InputBorder inputBorderEnabled = const UnderlineInputBorder(
      borderSide: BorderSide(width: 2, color: Color(0xFF3A86FF)));

  TextStyle formLabelStyle = const TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: 15,
    color: Color.fromARGB(255, 134, 140, 149),
  );

  TextStyle formInputStyle =
      const TextStyle(color: Color(0xFF222A3F), fontWeight: FontWeight.bold);

  final _dateMaskFormatter = MaskTextInputFormatter(
      mask: '####-##-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  final _reminderIdFormatter = MaskTextInputFormatter(
      mask: '######',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  final _formKey = GlobalKey<FormState>();

  FireStoreDatabase fs = FireStoreDatabase();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),

            ///place where the id of the task is in
            Text(
              "Reminder Id,",
              style: formLabelStyle,
            ),
            TextFormField(
              validator: (value) {
                if (value == null) {
                  return "Empty fields are not allowed";
                } else {
                  if (value.length < 6) {
                    return "Length can not be length than 6";
                  }
                }
                return null;
              },
              inputFormatters: [_reminderIdFormatter],
              keyboardType: TextInputType.number,
              style: formInputStyle,
              controller: _reminderId,
              decoration: InputDecoration(enabledBorder: inputBorderEnabled),
            ),

            ///
            const SizedBox(
              height: 30,
            ),
            ////place where BU will be placed
            Text(
              "Business Unit",
              style: formLabelStyle,
            ),
            DropdownButtonFormField(
                validator: (value) {
                  if (value == null || value.toString() == '-') {
                    return "Empty fields are not allowed";
                  }
                  return null;
                },
                style: formInputStyle,
                decoration: InputDecoration(enabledBorder: inputBorderEnabled),
                value: _selectedBuValue,
                items: bu.map((e) {
                  return DropdownMenuItem<String>(
                      value: e.toString(), child: Text(e.toString()));
                }).toList(),
                onChanged: (val) {
                  setState(() {
                    _selectedBuValue = val.toString();
                  });
                }),

            const SizedBox(
              height: 30,
            ),

            ////Place where Type MRO , Project Lead will be mentioned
            Text(
              "Reminder Type",
              style: formLabelStyle,
            ),
            DropdownButtonFormField(
                validator: (value) {
                  if (value == null || value.toString() == '-') {
                    return "Empty fields are not allowed";
                  }
                  return null;
                },
                style: formInputStyle,
                decoration: InputDecoration(enabledBorder: inputBorderEnabled),
                value: selectedTaskValue,
                items: taskTypes.map((e) {
                  return DropdownMenuItem<String>(
                      value: e.toString(), child: Text(e.toString()));
                }).toList(),
                onChanged: (val) {
                  setState(() {
                    selectedTaskValue = val.toString();
                  });
                }),

            const SizedBox(
              height: 30,
            ),

            Text(
              "Entry Date",
              style: formLabelStyle,
            ),
            TextFormField(
              validator: (value) {
                if (value == null) {
                  return "Empty fields are not allowed";
                } else if (value.length < 8) {
                  return "The length can not be less than 8";
                }
                return null;
              },
              inputFormatters: [_dateMaskFormatter],
              keyboardType: TextInputType.datetime,
              style: formInputStyle,
              controller: _entryDate,
              decoration: InputDecoration(enabledBorder: inputBorderEnabled),
              onChanged: (val) {},
            ),

            const SizedBox(
              height: 30,
            ),
            Text(
              "Reminder Category",
              style: formLabelStyle,
            ),
            DropdownButtonFormField(
                style: formInputStyle,
                decoration: InputDecoration(enabledBorder: inputBorderEnabled),
                value: _reminderCategory,
                items: sendMeReminder.map((e) {
                  return DropdownMenuItem<String>(
                      value: e.toString(), child: Text(e.toString()));
                }).toList(),
                onChanged: (val) {
                  setState(() {
                    _reminderCategory = val.toString();
                  });
                }),

            const SizedBox(
              height: 30,
            ),

            Center(
                child: SizedBox(
              height: 50,
              width: 225,
              child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                          const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)))),
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xFF3F52E3))),
                  onPressed: () async {
                    if (_formKey.currentState != null) {
                      if (_formKey.currentState!.validate()) {
                        Reminder reminder = Reminder(
                            id: _reminderId.text.toString(),
                            businessUnit: _selectedBuValue.toString(),
                            reminderCategory: _reminderCategory,
                            reminderType: selectedTaskValue,
                            entryDate:
                                DateTime.parse(_entryDate.text.toString()));

                        await fs.addRemindertoDatabase(reminder).then((value) {
                          if (value == null) {
                            ////success screen will go here
                          } else {
                            ////error screen will go here
                          }
                        });
                      }
                    }
                  },
                  child: const Text(
                    "Create New Reminder",
                    style: TextStyle(fontSize: 15),
                  )),
            )),
          ],
        ));
  }
}
