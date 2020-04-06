import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  final String title;
  Cart({this.title});
  @override
  _CartState createState() => _CartState();
}



class _CartState extends State< Cart > {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
    );
  }
}