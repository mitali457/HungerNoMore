import 'package:flutter/material.dart';

import 'package:newapp/Utils/theme.dart';
import 'package:newapp/Widget/theme_button.dart';

class Settingtheme extends StatefulWidget {
  Settingthemestate createState() => Settingthemestate();
}

class Settingthemestate extends State<Settingtheme> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Text('Settings', style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ExpansionTile(
              title: Text('Change Theme',
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold)),
              children: <Widget>[
                Column(children: <Widget>[
                  Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.grey.shade400))),
                      child: Themesetbutton(
                        themename: 'Green Theme',
                        userchoice: greentheme,
                      )),
                  Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.grey.shade400))),
                      child: Themesetbutton(
                        themename: 'Light Theme',
                        userchoice: lighttheme,
                      )),
                  Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.grey.shade400))),
                      child: Themesetbutton(
                        themename: 'Dark Theme',
                        userchoice: darktheme,
                      )),
                ]),
              ]),
          ExpansionTile(
              title: Text('Connected Accounts',
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold)),
              children: <Widget>[
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom:
                                            BorderSide(color: Colors.grey.shade400))),
                                child: Text('Connect Facebook account',
                                    style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold))),
                          ),
                        ],
                      ),
                    ])
              ]),
          ExpansionTile(
              title: Text('Account Settings',
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold)),
              children: <Widget>[
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom:
                                            BorderSide(color: Colors.grey.shade400))),
                                child: Text('Change Email',
                                    style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),textAlign: TextAlign.start,)),
                          ),
                        ],
                      ),
                      
                      Row(mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(color: Colors.grey.shade400),
                                        
                                        )),
                                child: Text('Delete Account',style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold))),
                          ),
                        ],
                      ),
                    ]),
              ]),
        ],
      ),
    );
  }
}
