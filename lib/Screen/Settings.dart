
import 'package:flutter/material.dart';

import 'package:newapp/Utils/theme.dart';
import 'package:newapp/Widget/theme_button.dart';

class Settingtheme extends StatefulWidget {
  Settingthemestate createState() => Settingthemestate();
}

class Settingthemestate extends State<Settingtheme> 
{
  
  Widget build(BuildContext context) 
  {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Column(
        children: <Widget>
        [
        //Themesetbutton(themename: 'Blue Theme', userchoice: bluetheme,),
        //Themesetbutton(themename: 'Purple Theme', userchoice: purpletheme,),
        Themesetbutton(themename: 'Green Theme', userchoice: greentheme,),
        Themesetbutton(themename: 'Light Theme', userchoice: lighttheme,),
        Themesetbutton(themename: 'Dark Theme', userchoice: darktheme,),
      ]),
    );
  }
}