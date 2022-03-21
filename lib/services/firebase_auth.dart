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
}
