import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';

class Category extends StatefulWidget {
  Category({Key key}) : super(key: key);

  @override
  CategoryState createState() => CategoryState();
}

class CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories!!'),
      ),
        body:  Container(
      child:  Center(
        child:  FutureBuilder(
            future:
                DefaultAssetBundle.of(context).loadString('assets/datas.json'),
            builder: (context, snapshot) {
              print("snapshot ${snapshot.data}");
              var datas = json.decode( snapshot.data);

              return  ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  print("index $index");
                  var data = datas[index];
                                    print("index $data");

                  return  Card(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                         Text( data['Name'],
                            style: TextStyle( color:Colors.blueGrey,
                                fontWeight: FontWeight.bold, fontSize: 24)),
                        //  Text( data['minOrder'].toString(),
                        //     style: TextStyle(
                        //         fontWeight: FontWeight.normal, fontSize: 20)),
                        //  Text("Items: " + data['Items'],
                        //     style: TextStyle(
                        //         fontWeight: FontWeight.normal, fontSize: 20)),
                         Image.asset(data['Image'], height: 200)
                      ],
                    ),
                  );
                },
                itemCount: datas == null ? 0 : datas.length,
              );
            }),
      ),
    ));
  }
}
