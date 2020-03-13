// import 'package:flutter/material.dart';

import 'dart:async';

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
    var _duration = Duration(seconds: 3);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    print('here');
    Navigator.of(context).pushReplacementNamed("/login");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: BoxDecoration(
        image:
            DecorationImage(image: splashimage, fit: BoxFit.fill),
      ));
      
    
  }
}