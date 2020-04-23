import 'package:flutter/material.dart';
import 'package:newapp/Services/firebase_auth.dart';

onPressedRegistration(BuildContext context, email, password, name) async {
  if (email.text.isEmpty || password.text.isEmpty) {
    print(email.text);
    print(password.text);
    print('Email and Password can not Empty');
    return;
  }
  bool res = await AuthenticationService()
      .createUserWithNewEmail(email.text, password.text, name.text);

  if (!res) {
    // print(
    //     'Already Registerd Your Account!\nPlease Login');
    //   scaffoldKey.currentState.showSnackBar(
    //       new SnackBar(
    //           content: new Text(
    //               "Already Registerd Your Account!\nPlease Login")));
  } else
    Navigator.of(context).pushNamed("/login");
}
