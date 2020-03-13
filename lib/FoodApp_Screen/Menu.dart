import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:newapp/Utils/colors.dart';

class MenuItem extends StatefulWidget {
  MenuItemstate createState() => MenuItemstate();
}

class MenuItemstate extends State<MenuItem> {
  final String url = "https://api.myjson.com/bins/1en5ry";
  List<dynamic> food;
  @override
  void initState() {
    this.getData();
  }

  Future<String> getData() async {
    var response = await http
        .get(Uri.encodeFull(url), headers: {"ACCEPT": "application/json"});
    setState(() {
      var convertDataToJson = json.decode(response.body);
      food = convertDataToJson['foods'];
    });
    return "success";
  }
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('MenuItems!!'),),
        
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: food.length,
          itemBuilder: (context, index) {
            return InkWell(
                onTap: () {
                 Navigator.of(context).pushNamed("/cart");
                },
                child: Container(
                  margin: EdgeInsets.all(5),
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(color: greencolor, blurRadius: 4)
                      ]),
                  child: Column(children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(bottom: 10),
                        width: 200,
                        height: 160,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                  food[index]['foodimage'],
                                ),
                                fit: BoxFit.cover))),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[Text(food[index]['foodname'],style: TextStyle( color:Colors.blueGrey,
                                fontWeight: FontWeight.bold, fontSize: 18))],
                    )
                  ]),
                ));
          },
        ));
  }
}

