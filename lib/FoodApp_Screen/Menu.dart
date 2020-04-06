// import 'package:flutter/material.dart';

// class MenuItem extends StatefulWidget{
//   @override
//   State<StatefulWidget> createState() {
    
//     return _MenuItemState();
//   }
  
// }
// class _MenuItemState extends State<MenuItem> {
//   @override
//   Widget build(BuildContext context) {
    
//     return  Scaffold(
//         appBar: AppBar(
//           title: Text('Menu Items'),
//         ),
//         body:SafeArea(
//           child: ListView(children: <Widget>[
//            Padding(
//               padding: const EdgeInsets.only(left:15.0, right: 15.0, top: 15.0),
//               child: Container(
//                 height: 40.0,
//                 child: ListView(
//                   scrollDirection: Axis.horizontal,
//                   children: <Widget>[
//                     Container(
//                       decoration: BoxDecoration(
//                         color: Colors.green,
//                         borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.only(left:20.0, right: 20.0, top: 5.0, bottom: 5.0),
//                         child: Center(
//                           child: FlatButton(
//                           child: Text("Breakfast", style: TextStyle(color: Colors.white, fontSize: 16.0, letterSpacing: 0.5),),
                        
//                         onPressed: () {
                      
//                     }
//                     )),
//                       ),
//                     ),
//                     SizedBox(width: 10.0,),
//                     Container(
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                         border: new Border.all(color: Colors.green),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.only(left:20.0, right: 20.0, top: 5.0, bottom: 5.0),
//                         child: Center(
//                           child: Text("Lunch", style: TextStyle(
//                             color: Colors.green,
//                             fontSize: 16.0,
//                             letterSpacing: 0.5
//                           ),),
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: 10.0,),
//                     Container(
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                         border: new Border.all(color: Colors.green),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.only(left:20.0, right: 20.0, top: 5.0, bottom: 5.0),
//                         child: Center(
//                           child: Text("Snacks", style: TextStyle(
//                               color: Colors.green,
//                               fontSize: 16.0,
//                               letterSpacing: 0.5
//                           ),),
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: 10.0,),
//                     Container(
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                         border: new Border.all(color: Colors.green),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.only(left:20.0, right: 20.0, top: 5.0, bottom: 5.0),
//                         child: Center(
//                           child: Text("Brunch", style: TextStyle(
//                               color: Colors.green,
//                               fontSize: 16.0,
//                               letterSpacing: 0.5
//                           ),),
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: 10.0,),
//                     Container(
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                         border: new Border.all(color: Colors.green),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.only(left:20.0, right: 20.0, top: 5.0, bottom: 5.0),
//                         child: Center(
//                           child: Text("Dinner", style: TextStyle(
//                               color: Colors.green,
//                               fontSize: 16.0,
//                               letterSpacing: 0.5
//                           ),),
//                         ),
//                       ),

//         ),
//                   ]
//         ),
//               )
//            )
//           ]
//         ),
//         ),
//       );
  
//   }
  
// }
import 'dart:convert';

import 'package:flutter/material.dart';



class MenuItem extends StatefulWidget {
  MenuItem({Key key}) : super(key: key);

  @override
  MenuItemState createState() =>MenuItemState();
}

class MenuItemState extends State<MenuItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new Container(
      child: new Center(
        child: new FutureBuilder(
            future :
                DefaultAssetBundle.of(context).loadString('assets/data.json'),
            builder: (context, snapshot) {
              var datas = json.decode(snapshot.data.toString());

              return new ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                   var data = datas[index];
                  return new Card(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        new Text("Name: " + data['Name'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24)),
                        new Text("Item: " + data['Items'],
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 20)),
                        new Text("Minorder: " + data['minOrder'],
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 20)),
                        new Image.network(data['image'], height: 200)
                      ],
                    ),
                  );
                },
                itemCount: datas== null ? 0 : datas.length,
              );
            }),
      ),
    ));
  }
}