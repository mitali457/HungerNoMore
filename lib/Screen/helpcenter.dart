import 'package:flutter/material.dart';
import 'package:newapp/Utils/images.dart';

class HelpCenter extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(),
      body:Center(child: Row(children: <Widget>[
        Container(child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
           Padding(padding: EdgeInsets.only(left:20),
           
           child:Text('  Help Center\n please get in touch & \n we will be happy to help you',
           style: TextStyle(
                      
                        fontSize: 17,
                        //fontWeight: FontWeight.bold,
                        color:Colors.blueGrey,
                        )
           ),
           ),
           Container(
             margin: EdgeInsets.only(top:60,left: 10,right: 10),
             width:150,
             height:200,
             decoration:BoxDecoration(
               image: DecorationImage(image: helpimage,
               fit:BoxFit.cover
               ),
             borderRadius: BorderRadius.circular(40)
             )
           )
        ]
           
        ,),)
      ],),)
    );
  }
  
}