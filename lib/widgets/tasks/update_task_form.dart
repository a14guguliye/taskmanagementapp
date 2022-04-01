import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:taskmanagementapp/models/reminder.dart';
import 'package:taskmanagementapp/screens/feedback/failure.dart';
import 'package:taskmanagementapp/screens/feedback/success.dart';
import 'package:taskmanagementapp/services/firebase_store.dart';

List<String> bu = ['-', 'PRM', 'ISV', 'FC', 'MULTIBU'];
List<String> taskTypes = ['-', 'MRO', 'LEAD', 'PROJECT'];
List<String> sendMeReminder = ['1', '2', '3', '4'];

class UpdateTaskForm extends StatefulWidget {
  final Reminder passedReminder;
  const UpdateTaskForm({Key? key, required this.passedReminder})
      : super(key: key);

  @override
  State<UpdateTaskForm> createState() => _UpdateTaskFormState();
}

class _UpdateTaskFormState extends State<UpdateTaskForm> {
  ///Below variable will hold the selected bu value for the reminder object
  ///and it will be updated with the controller text of Bu textinput
  String _selectedBuValue = bu[0].toString();

  ///Reminder category will hold a value that will tell me the period where the reminder
  ///should be send as per. For example, if it is 1, the reminder should be sent every day
  ///or 2, reminder should be sent every 2 days, or 3---reminder should be sent in every
  ///3day
  String _reminderCategory = sendMeReminder[2];

  ////below inputborder style will be used to draw the horizontal line
  ///below the input of the form
  InputBorder inputBorderEnabled = const UnderlineInputBorder(
      borderSide: BorderSide(width: 2, color: Color(0xFF3A86FF)));

  ///below text style will be used to style the labels o the form
  TextStyle formLabelStyle = const TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: 15,
    color: Color.fromARGB(255, 134, 140, 149),
  );

  ////below text style will be used to style the form input data fields
  ///This text will be the text which user enters. These texts will be used
  ///as per the below style
  TextStyle formInputTextStyle =
      const TextStyle(color: Color(0xFF222A3F), fontWeight: FontWeight.bold);

  ///// below input mask will e used for the styling of the date field
  final _dateMaskFormatter = MaskTextInputFormatter(
      mask: '####-##-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  ///below key will be used to validate the form fields
  final _formKey = GlobalKey<FormState>();

  ///below reference will be used to get the reference to the FireStoreDatabase i wrote
  ///initially
  FireStoreDatabase fs = FireStoreDatabase();

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ///below controller will be used to get the text value of the reminder
    final TextEditingController _reminderId =
        TextEditingController(text: widget.passedReminder.id.toString());

    ////below controller will be used to get the text value of entry date
    TextEditingController _entryDate = TextEditingController(
        text: widget.passedReminder.reminderDate.toString());

    ///below controller will be used to get the text value of the description
    final TextEditingController _description =
        TextEditingController(text: widget.passedReminder.description);

    ////Below variable will hold the selected task type whether it is MRO TASK, or
    ///lead, or project, whatever. That value will be updated as per value coming
    ///out of controller of task value textinput
    String selectedTaskValue = widget.passedReminder.reminderType;

    ///Below variable will hold the selected bu value for the reminder object
    ///and it will be updated with the controller text of Bu textinput
    String _selectedBuValue = widget.passedReminder.businessUnit.toString();

    ///below form is for the reminders
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///take some breathing room
            const SizedBox(
              height: 15,
            ),

            ///place where the id of the task is in
            Text(
              "Reminder Id,",
              style: formLabelStyle,
            ),

            ///below text form field is for the id of the task
            ///each task should have 6 digits code required. if
            ///user enters any text with the length of less than 6
            ///or null, the validator will now allow the user to proceed
            ///further
            TextFormField(
              controller: _reminderId,
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
              style: formInputTextStyle,
              decoration: InputDecoration(enabledBorder: inputBorderEnabled),
            ),

            ///taking some breathing room

            ///taking some breathing room
            const SizedBox(
              height: 30,
            ),

            Text(
              "Business Unit",
              style: formLabelStyle,
            ),
            ////place where BU will be placed.
            ///Currently there are 4 BU s which are provided to be
            ///chosen
            DropdownButtonFormField(
                validator: (value) {
                  if (value == null || value.toString() == '-') {
                    return "Empty fields are not allowed";
                  }
                  return null;
                },
                style: formInputTextStyle,
                decoration: InputDecoration(enabledBorder: inputBorderEnabled),
                value: _selectedBuValue,
                items: bu.map((e) {
                  return DropdownMenuItem<String>(
                      value: e.toString(), child: Text(e.toString()));
                }).toList(),
                onChanged: (val) {
                  _selectedBuValue = val.toString();
                }),

            const SizedBox(
              height: 30,
            ),

            ////Place where Type MRO , Project Lead will be mentioned
            Text(
              "Reminder Type",
              style: formLabelStyle,
            ),

            /////below dropdown field will be used to choose the
            ///category of the each task
            ///it can be ALL, MRO, PROJECT, LEAD
            ///or whatever user decides to choose
            DropdownButtonFormField(
                validator: (value) {
                  if (value == null || value.toString() == '-') {
                    return "Empty fields are not allowed";
                  }
                  return null;
                },
                style: formInputTextStyle,
                decoration: InputDecoration(enabledBorder: inputBorderEnabled),
                value: widget.passedReminder.reminderType.toString(),
                items: taskTypes.map((e) {
                  return DropdownMenuItem<String>(
                      value: e.toString(), child: Text(e.toString()));
                }).toList(),
                onChanged: (val) {
                  selectedTaskValue = val.toString();
                }),

            const SizedBox(
              height: 30,
            ),

            Text(
              "New Reminder Date",
              style: formLabelStyle,
            ),

            ////below textFormfield will be used to enter the date
            ///the date format as of now will be yyyy-mm-dd format
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
              style: formInputTextStyle,
              controller: _entryDate,
              decoration: InputDecoration(enabledBorder: inputBorderEnabled),
            ),

            ///taking some breathing room
            const SizedBox(
              height: 30,
            ),
            Text(
              "Reminder Category",
              style: formLabelStyle,
            ),

            ///here period is chosen on which the reminders to be sent to the
            ///user
            DropdownButtonFormField(
                style: formInputTextStyle,
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

            Text(
              "Description",
              style: formLabelStyle,
            ),

            TextFormField(
              style: formInputTextStyle,
              controller: _description,
              decoration: InputDecoration(enabledBorder: inputBorderEnabled),
            ),

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
                            entryDate: widget.passedReminder.entryDate,
                            description:
                                _description.text.toString().toLowerCase(),
                            reminderDate:
                                DateTime.parse(_entryDate.text.toString()));

                        await fs.addRemindertoDatabase(reminder).then((value) {
                          if (value == null) {
                            ///popping the form
                            ////success screen will go here
                            Navigator.of(context).pop();

                            ///pushing the success room
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (builder) {
                              return const SuccessScreen();
                            }));
                          } else {
                            ////error screen will go here
                            //////popping the form
                            ////error screen will go here
                            Navigator.of(context).pop();

                            ///pushing the success room
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (builder) {
                              return const ErrorScreen();
                            }));
                          }
                        });
                      }
                    }
                  },
                  child: const Text(
                    "Update New Reminder",
                    style: TextStyle(fontSize: 15),
                  )),
            )),
          ],
        ));
  }
}
