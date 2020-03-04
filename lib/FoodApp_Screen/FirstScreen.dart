import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  final String title;
 FirstScreen  ({this.title});
  @override
  _FirstScreenState createState() => _FirstScreenState();
}



class _FirstScreenState extends State<FirstScreen > {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
    );
  }
}