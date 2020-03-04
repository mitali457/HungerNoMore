// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class UserAccount extends StatefulWidget{
//   @override
//   _UserAccountState createState() => _UserAccountState();
// }

// class _UserAccountState extends State<UserAccount> {
//   File _image;
 
//  Future getImagegallery() async {
//     var imagegallery = await ImagePicker.pickImage(source: ImageSource.gallery);
   


//     setState(() {
//       _image =  imagegallery;
     
//     });}
//   @override
//   Widget build(BuildContext context) {
    
//     return MaterialApp(
//       home: SafeArea(
//         child: Scaffold(
//           backgroundColor: Colors.white,
//           appBar: PreferredSize(
//             preferredSize: Size.fromHeight(80.0),
//             child: AppBar(
//               flexibleSpace: Column(
                
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
                  
               
//                     Text(" Your Account!!",
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.w500,
//                           fontSize: 22)),
                 
               
//                 ],
//               ),
//               elevation: 0.0,
//               backgroundColor: Colors.green,
//               brightness: Brightness.light,
//             ),
//           ),
          
//           body: SingleChildScrollView(
            
//             child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: <Widget>[
//                   Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         _image == null ?
//                         Container(
//                           width: 200,
//                           height: 200,
                          
                          
//                          child: CircleAvatar(
//                            backgroundColor: Colors.green,
//                     backgroundImage: NetworkImage('https://www.searchpng.com/wp-content/uploads/2019/02/Deafult-Profile-Pitcher.png',),
//                  ),
                          
//                           margin: EdgeInsets.all(20),
                          
                              
//                         ) :  Container(
                         
//                           decoration: BoxDecoration(image: DecorationImage(image: FileImage(_image),fit: BoxFit.cover), 
//                           ),
                          
                          
//                         )
//                       ]),
//                       Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
              
//               RaisedButton(
//               onPressed: (){
//                 getImagegallery();
//               },
//                 color: Colors.green,
//                 child: Text('Upload your Profile picture',style: TextStyle(color:Colors.white),),
//               ),
//             ],
//           ),
         
// //  Padding(padding: EdgeInsets.only(left:60,top:20),child: TextFormField(maxLines: 6,decoration:InputDecoration(border: InputBorder.none,hintText: 'Write something here')),
// //             ),
// //             Row(
// //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //             children: <Widget>[
// //               RaisedButton(
// //                onPressed: (){},
// //                 color: Colors.green,
// //                 child: Text('Edit',style: TextStyle(color:Colors.white),),
// //               ),
// //               RaisedButton(
// //               onPressed: (){},
// //                 color: Colors.green,
// //                 child: Text('Save',style: TextStyle(color:Colors.white),),
// //               ),
// //             ],
// //           ),
//                 ]),
                
//           ),
//         ),
//       ),
//     );
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
        body: Container(
      child:  Center(
        child:  FutureBuilder(
            future:
                DefaultAssetBundle.of(context).loadString('assets/datas.json'),
            builder: (context, snapshot) {
              var datas = json.decode(snapshot.data.toString());
              

              return  ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  var data = datas[index];
                  return  Card(
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text("Name: " + data['Name'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24)),
                         Text("Item: " + data['Items'],
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 20)),
                         Text("Minorder: " + data['minOrder'],
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 20)),
                         Image.network(data['image'], height: 200)
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