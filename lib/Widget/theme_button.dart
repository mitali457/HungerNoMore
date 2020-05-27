import 'package:flutter/material.dart';
import 'package:newapp/Provider/themechange_provider.dart';

import 'package:provider/provider.dart';


class Themesetbutton extends StatelessWidget 
{
   final String themename;
   final ThemeData userchoice;
   Themesetbutton({Key key, @required this.themename,@required this.userchoice }) : super(key:key);
  @override
  Widget build(BuildContext context) 
  {
    FoodItemsproviderchange themeChange = Provider.of<FoodItemsproviderchange>(context);
    return FlatButton(
      onPressed: (){
        themeChange.setTheme(userchoice);
      },
      child: Row(children: <Widget>[Text(themename,
      style: TextStyle(color:Colors.blueGrey,fontSize: 18,fontWeight: FontWeight.bold),
      )]),
    );
  }
}