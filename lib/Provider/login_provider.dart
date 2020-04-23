import 'dart:math';

import 'package:flutter/material.dart';


import 'package:newapp/Services/firebase_auth.dart';
import 'package:newapp/Utils/constant.dart';

onPressedLogin(
    BuildContext context, emailController, passwordController) async {
  if (emailController.text.isEmpty || passwordController.text.isEmpty) {
    print('Email and Password can not Empty');
    return;
  }
  bool res = await AuthenticationService()
      .signInWithEmail(emailController.text, passwordController.text);

  if (!res) {
    print(e);
    scaffoldKey.currentState.showSnackBar(new SnackBar(
        content: new Text("No user Found! Please Register your New Account")));
  } else
    Navigator.of(context).pushNamed("/homescreen");
}
