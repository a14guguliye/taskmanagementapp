import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taskmanagementapp/models/user.dart';

class FireStoreDatabase {
  ////initializing the firestore to cook the things within
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  ////getting the collection reference for the users
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

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
}
