import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newapp/FoodApp_Screen/Homescreen.dart';
import 'package:newapp/FoodApp_Screen/Login.dart';
import 'package:newapp/FoodApp_Screen/Registration.dart';
import 'package:newapp/FoodApp_Screen/splash.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green,
        accentColor: Colors.green,
      ),
      routes: {
        '/login': (context) => Login(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/registration': (context) => Registration(),
      },
      home: Login(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (context,AsyncSnapshot<FirebaseUser> snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting)
          return SplashPage();
        if(!snapshot.hasData || snapshot.data == null)
          return Login();
        return Homescreen();
      },
    );
  }
}
