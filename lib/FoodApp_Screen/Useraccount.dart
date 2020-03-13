import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:newapp/Utils/colors.dart';

class UserAccount extends StatefulWidget{
  @override
  _UserAccountState createState() => _UserAccountState();
}

class _UserAccountState extends State<UserAccount> {
  File _image;
 
 Future getImagegallery() async {
    var imagegallery = await ImagePicker.pickImage(source: ImageSource.gallery);
   


    setState(() {
      _image =  imagegallery;
     
    });}
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(80.0),
            child: AppBar(
              flexibleSpace: Column(
                
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
               
                    Text(" Your Account!!",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 22)),
                 
               
                ],
              ),
              elevation: 0.0,
              backgroundColor: greencolor,
              brightness: Brightness.light,
            ),
          ),
          
          body: SingleChildScrollView(
            
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        _image == null ?
                        Container(
                          width: 200,
                          height: 200,
                          
                          
                         child: CircleAvatar(
                           backgroundColor: greencolor,
                    backgroundImage: NetworkImage('https://www.searchpng.com/wp-content/uploads/2019/02/Deafult-Profile-Pitcher.png',),
                 ),
                          
                          margin: EdgeInsets.all(20),
                          
                              
                        ) :  Container(
                         
                          decoration: BoxDecoration(image: DecorationImage(image: FileImage(_image),fit: BoxFit.cover), 
                          ),
                          
                          
                        )
                      ]),
                      Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              
              RaisedButton(
              onPressed: (){
                getImagegallery();
              },
                color: greencolor,
                child: Text('Upload your Profile picture',style: TextStyle(color:Colors.white),),
              ),
            ],
          ),
         
//  Padding(padding: EdgeInsets.only(left:60,top:20),child: TextFormField(maxLines: 6,decoration:InputDecoration(border: InputBorder.none,hintText: 'Write something here')),
//             ),
//             Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               RaisedButton(
//                onPressed: (){},
//                 color: Colors.green,
//                 child: Text('Edit',style: TextStyle(color:Colors.white),),
//               ),
//               RaisedButton(
//               onPressed: (){},
//                 color: Colors.green,
//                 child: Text('Save',style: TextStyle(color:Colors.white),),
//               ),
//             ],
//           ),
                ]),
                
          ),
        ),
      ),
    );
  }
  
}
