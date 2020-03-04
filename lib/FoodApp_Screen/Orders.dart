import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  final String title;
  Orders({this.title});
  @override
  _OrdersState createState() => _OrdersState();
}



class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Text('Your orders'),
      ),
    );
  }
}