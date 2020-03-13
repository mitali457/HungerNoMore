import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newapp/FoodApp_Screen/Homescreen.dart';
import 'package:newapp/FoodApp_Screen/Login.dart';

import 'package:newapp/FoodApp_Screen/splash.dart';
import 'package:newapp/Route/routes.dart';
import 'package:newapp/Utils/colors.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: greencolor,
        accentColor: greencolor,
      ),
      routes: Routes.getRoutes(),
      initialRoute: '/',
      
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
          return SplashScreen();
        if(!snapshot.hasData || snapshot.data == null)
          return Login();
        return Homescreen();
      },
    );
  }
}
