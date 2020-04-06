import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';
import 'package:newapp/Widget/Drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Category extends StatefulWidget {
  Category({Key key}) : super(key: key);

  @override
  CategoryState createState() => CategoryState();
}

class CategoryState extends State<Category> {
  SharedPreferences sharedPreferences;
  String email;
  bool loader =true;
  @override
  void initState() {
    super.initState();
    //_getcategories();
    _getNameEmail();
    //  _getrestaurants();
  }

  _getNameEmail() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      email = sharedPreferences.getString("username");
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories!!'),
      ),
      drawer: CustomDrawer(),
        body: 
        // loader ?
        // Center(child: CircularProgressIndicator()): 
        Container(
      child:  Center(
        child:  FutureBuilder(
            future:
                DefaultAssetBundle.of(context).loadString('assets/datas.json'),
            builder: (context, snapshot) {
              if(!snapshot.hasData)
              return Center(child: CircularProgressIndicator());
              print("snapshot ${snapshot.hasData}");
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
