import 'package:firebase_auth/firebase_auth.dart';

class FireBaseAuthService {
  ////gettingt the instance of FireBaseAuthentication
  final FirebaseAuth _auth = FirebaseAuth.instance;

  ////specifying the way email link will be sent
  ///parameters
  final _actionCodeSettings = ActionCodeSettings(
    url: 'https://taskmanagement-54879.firebaseapp.com',
    androidPackageName: 'com.example.taskmanagementapp',
    handleCodeInApp: true,
  );

  ///below is the future function that will be used
  ///to send email link to the signed user
  Future<void> sendEmailLink(String email) async {
    await _auth
        .sendSignInLinkToEmail(
            email: email, actionCodeSettings: _actionCodeSettings)
        .catchError((error) {
      throw (error.toString());
    }).then((value) => null);
  }

  ////getting the user credential once the user signed in successfully
  ///the Functiont takes in two arguments, incoming emaillink + email user provided
  ///throws error if there is any
  Future<UserCredential?> signInWithEmailLink(
      String emailedLink, String email) async {
    if (_auth.isSignInWithEmailLink(emailedLink)) {
      return _auth
          .signInWithEmailLink(email: email, emailLink: emailedLink)
          .catchError((error) => throw (error));
    }
    return null;
  }

  ////signing out
  Future<void> signmeOutFromApp() async {
    await _auth.signOut();
  }

  String get getMeCurrentUserUid {
    return _auth.currentUser!.uid.toString();
  }
}
