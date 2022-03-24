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
        'entrydate': newReminder.entryDate
      }).then((value) {
        return null;
      });
    } catch (e) {
      return "error";
    }
    return null;
  }

  ///getting the list of reminders
  Future<List<Reminder>> getMeReminders(int tappedCategory) async {
    List<Reminder> reminders = [];

    if (tappedCategory == 0) {
      await remindersCollectionReference
          .get()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((reminder) {
          reminders.add(Reminder(
              id: reminder.id,
              businessUnit: reminder['businessunit'],
              reminderCategory: reminder['remindercategory'],
              reminderType: reminder['remindertype'],
              entryDate: reminder['entrydate'].toDate()));
        });
      });
    } else if (tappedCategory == 1) {
      await remindersCollectionReference
          .where('remindertype', isEqualTo: 'MRO')
          .get()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((reminder) {
          reminders.add(Reminder(
              id: reminder.id,
              businessUnit: reminder['businessunit'],
              reminderCategory: reminder['remindercategory'],
              reminderType: reminder['remindertype'],
              entryDate: reminder['entrydate'].toDate()));
        });
      });
    } else if (tappedCategory == 2) {
      await remindersCollectionReference
          .where('remindertype', isEqualTo: 'PROJECT')
          .get()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((reminder) {
          reminders.add(Reminder(
              id: reminder.id,
              businessUnit: reminder['businessunit'],
              reminderCategory: reminder['remindercategory'],
              reminderType: reminder['remindertype'],
              entryDate: reminder['entrydate'].toDate()));
        });
      });
    } else if (tappedCategory == 3) {
      await remindersCollectionReference
          .where('remindertype', isEqualTo: 'LEAD')
          .get()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((reminder) {
          reminders.add(Reminder(
              id: reminder.id,
              businessUnit: reminder['businessunit'],
              reminderCategory: reminder['remindercategory'],
              reminderType: reminder['remindertype'],
              entryDate: reminder['entrydate'].toDate()));
        });
      });
    }

    return reminders;
  }
}
