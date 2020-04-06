

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newapp/Utils/images.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var _duration = Duration(seconds: 4);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() async {
    print('Welcom to splash screen');
  try{
    final currentUser = await FirebaseAuth.instance.currentUser();
    if (currentUser != null) {
      Navigator.of(context).pushReplacementNamed("/homescreen");
    } else {
      Navigator.of(context).pushReplacementNamed("/login");
    }
  }
  
  catch(e){
    print(e);
    

  }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
      image: DecorationImage(image: splashimage, fit: BoxFit.fill),
    ));
  }
}
