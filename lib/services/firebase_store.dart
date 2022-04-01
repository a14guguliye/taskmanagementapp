import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taskmanagementapp/models/reminder.dart';
import 'package:taskmanagementapp/models/user.dart';

class FireStoreDatabase {
  ////initializing the firestore to cook the things within
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  ////getting the collection reference for the users
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  ///getting the collection reference for the reminders
  final CollectionReference remindersCollectionReference =
      FirebaseFirestore.instance.collection('reminders');

  //getter function for the reminder collection
  CollectionReference get getRemindersCollectionReference {
    return remindersCollectionReference;
  }

  ///getting the current User
  Future<Users> getMeCurrentUser(String documentId) async {
    var userDocument = await users.doc(documentId).get();
    return getMeCurrentUserObject(doc: userDocument, uid: documentId);
  }

  ///generating the current user model
  Users getMeCurrentUserObject(
      {required DocumentSnapshot doc, required String uid}) {
    return Users(name: doc['name'], surname: doc['surname'], uid: uid);
  }

  ////adding the reminder to the database
  Future<String?> addRemindertoDatabase(Reminder newReminder) async {
    try {
      await remindersCollectionReference.doc(newReminder.id).set({
        'businessunit': newReminder.businessUnit,
        'remindertype': newReminder.reminderType,
        'remindercategory': newReminder.reminderCategory,
        'entrydate': DateTime.now(),
        'reminderdate': newReminder.reminderDate,
        'description': newReminder.description
      }).then((value) {
        return null;
      });
    } catch (e) {
      return "error";
    }
    return null;
  }

  ////updating the reminder
  Future<String?> updateReminder(Reminder changedReminder) async {
    try {
      await remindersCollectionReference.doc(changedReminder.id).set({
        'businessunit': changedReminder.businessUnit,
        'remindertype': changedReminder.reminderType,
        'remindercategory': changedReminder.reminderCategory,
        'entrydate': changedReminder.entryDate,
        'reminderdate': changedReminder.reminderDate,
        'description': changedReminder.description
      }).then((value) {
        return null;
      });
    } catch (e) {
      return "error";
    }
    return null;
  }

  ///getting the list of reminders
  Future<List<Reminder>> getMeReminders(
      int tappedReminderCategory, int tappedBottomCategory) async {
    List<Reminder> reminders = [];
    DateTime todaysDate = DateTime.now();

    if (tappedReminderCategory == 0) {
      await remindersCollectionReference
          .get()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((reminder) {
          if (tappedBottomCategory == 0) {
            ////if home button is pressed, fetch all reminders
            reminders.add(Reminder(
              id: reminder.id,
              businessUnit: reminder['businessunit'],
              reminderCategory: reminder['remindercategory'],
              reminderType: reminder['remindertype'],
              entryDate: reminder['entrydate'].toDate(),
              reminderDate: reminder['reminderdate'].toDate(),
              description: reminder['description'],
            ));
          } else if (tappedBottomCategory == 1) {
            ////if notification button is pressed, fetch only today's tasks
            if (todaysDate
                    .difference(reminder['reminderdate'].toDate())
                    .inDays >=
                0) {
              reminders.add(
                Reminder(
                  id: reminder.id,
                  businessUnit: reminder['businessunit'],
                  reminderCategory: reminder['remindercategory'],
                  reminderType: reminder['remindertype'],
                  entryDate: reminder['entrydate'].toDate(),
                  reminderDate: reminder['reminderdate'].toDate(),
                  description: reminder['description'],
                ),
              );
            }
          }
        });
      });
    } else if (tappedReminderCategory == 1) {
      await remindersCollectionReference
          .where('remindertype', isEqualTo: 'MRO')
          .get()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((reminder) {
          if (tappedBottomCategory == 0) {
            ////if home button is pressed, fetch all reminders
            reminders.add(Reminder(
                id: reminder.id,
                businessUnit: reminder['businessunit'],
                reminderCategory: reminder['remindercategory'],
                reminderType: reminder['remindertype'],
                entryDate: reminder['entrydate'].toDate(),
                description: reminder['description'],
                reminderDate: reminder['reminderdate'].toDate()));
          } else if (tappedBottomCategory == 1) {
            ////if notification button is pressed, fetch only today's tasks
            if (todaysDate
                    .difference(reminder['reminderdate'].toDate())
                    .inDays >=
                0) {
              reminders.add(Reminder(
                  id: reminder.id,
                  businessUnit: reminder['businessunit'],
                  reminderCategory: reminder['remindercategory'],
                  reminderType: reminder['remindertype'],
                  entryDate: reminder['entrydate'].toDate(),
                  description: reminder['description'],
                  reminderDate: reminder['reminderdate'].toDate()));
            }
          }
        });
      });
    } else if (tappedReminderCategory == 2) {
      await remindersCollectionReference
          .where('remindertype', isEqualTo: 'PROJECT')
          .get()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((reminder) {
          if (tappedBottomCategory == 0) {
            ////if home button is pressed, fetch all reminders
            reminders.add(Reminder(
                id: reminder.id,
                businessUnit: reminder['businessunit'],
                reminderCategory: reminder['remindercategory'],
                reminderType: reminder['remindertype'],
                entryDate: reminder['entrydate'].toDate(),
                description: reminder['description'],
                reminderDate: reminder['reminderdate'].toDate()));
          } else if (tappedBottomCategory == 1) {
            ////if notification button is pressed, fetch only today's tasks
            if (todaysDate
                    .difference(reminder['reminderdate'].toDate())
                    .inDays >=
                0) {
              reminders.add(Reminder(
                  id: reminder.id,
                  businessUnit: reminder['businessunit'],
                  reminderCategory: reminder['remindercategory'],
                  reminderType: reminder['remindertype'],
                  entryDate: reminder['entrydate'].toDate(),
                  description: reminder['description'],
                  reminderDate: reminder['reminderdate'].toDate()));
            }
          }
        });
      });
    } else if (tappedReminderCategory == 3) {
      await remindersCollectionReference
          .where('remindertype', isEqualTo: 'LEAD')
          .get()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((reminder) {
          if (tappedBottomCategory == 0) {
            ////if home button is pressed, fetch all reminders
            reminders.add(Reminder(
                id: reminder.id,
                businessUnit: reminder['businessunit'],
                reminderCategory: reminder['remindercategory'],
                reminderType: reminder['remindertype'],
                entryDate: reminder['entrydate'].toDate(),
                description: reminder['description'],
                reminderDate: reminder['reminderdate'].toDate()));
          } else if (tappedBottomCategory == 1) {
            ////if notification button is pressed, fetch only today's tasks
            if (todaysDate
                    .difference(reminder['reminderdate'].toDate())
                    .inDays >=
                0) {
              reminders.add(Reminder(
                  id: reminder.id,
                  businessUnit: reminder['businessunit'],
                  reminderCategory: reminder['remindercategory'],
                  reminderType: reminder['remindertype'],
                  entryDate: reminder['entrydate'].toDate(),
                  description: reminder['description'],
                  reminderDate: reminder['reminderdate'].toDate()));
            }
          }
        });
      });
    }

    return reminders;
  }

  ///deleting the reminder from the database
  Future<void> delete(String docNumber) async {
    return await remindersCollectionReference.doc(docNumber).delete();
  }

  //snoozing the reminder from popping in the notification
  Future<void> snoozeReminder({required Reminder remindertoBeSnoozed}) async {
    await remindersCollectionReference
        .doc(remindertoBeSnoozed.id.toString())
        .update({
      'reminderdate':
          remindertoBeSnoozed.reminderDate!.add(const Duration(days: 1))
    });
  }
}
