import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:newapp/Model/imagepost.dart';

import 'package:newapp/Utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomDrawer extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() {
    return _CustomDrawerState();
  }
}

class _CustomDrawerState extends State<CustomDrawer> {
  
  List<Imagepost> imagepostlist = [];
  SharedPreferences sharedPreferences;
  String email;
  String name;
  @override
  void initState() {
    super.initState();
    _getNameEmail();
    DatabaseReference imagepostref =
        FirebaseDatabase.instance.reference().child("imagepost");

    imagepostref.once().then((DataSnapshot snap) {
     var keys = snap.value.keys;
      var data = snap.value;
      imagepostlist.clear();
      for (String individualkey in keys) {
        Imagepost imagepost = Imagepost(data[individualkey]['image']);
        imagepostlist.add(imagepost);
      }
      setState(() {
        print('length:$imagepostlist.length');
      });
    });
  }

  _getNameEmail() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      email = sharedPreferences.getString("username");
      name = sharedPreferences.getString("name");
    print("email $email");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(padding: EdgeInsets.zero, children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text( 'name',
           style: TextStyle(
                color: Colors.white,
                fontSize: 17.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold),
          ),
          accountEmail: Text(
            email,
            style: TextStyle(
                color: Colors.white,
                fontSize: 17.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold),
          ),

          currentAccountPicture: CircleAvatar(
            child: ClipOval(
              child: new SizedBox(
                  width: 180.0,
                  height: 180.0,
                  child: imagepostlist.length == 0
                      ? Text("")
                      : ListView.builder(
                          itemCount: imagepostlist.length,
                          itemBuilder: (_, index) {
                            print(imagepostlist[index]);
                            return imagepostUI(imagepostlist[index].image);
                          })),
            ),
          ),

          // decoration: BoxDecoration(
          //   color: greencolor,
          // ),
          // currentAccountPicture: CircleAvatar(
          //   backgroundColor: Theme.of(context).platform == TargetPlatform.iOS
          //       ? Colors.white
          //       : Colors.white,
          //   child: Text(
          //     "LOGIN",
          //     style: TextStyle(
          //         color: greencolor,
          //         fontSize: 17.0,
          //         fontStyle: FontStyle.italic,
          //         fontWeight: FontWeight.bold),
          //   ),
          // ),
        ),
        ListTile(
          title: Text('Home',
              style: TextStyle(
                  color: greencolor,
                  fontStyle: FontStyle.italic,
                  fontSize: 20)),
          trailing: Icon(Icons.arrow_forward, color: greencolor),
          onTap: () {
            Navigator.of(context).pushNamed("/homescreen");
          },
        ),
        ListTile(
          title: Text(
            'Your Orders',
            style: TextStyle(
                color: greencolor, fontStyle: FontStyle.italic, fontSize: 20),
          ),
          trailing: Icon(Icons.arrow_forward, color: greencolor),
          onTap: () {
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => Orders()));
          },
        ),
        ListTile(
          title: Text(
            'Your Account',
            style: TextStyle(
                color: greencolor, fontStyle: FontStyle.italic, fontSize: 20),
          ),
          trailing: Icon(Icons.arrow_forward, color: greencolor),
          onTap: () {
            Navigator.of(context).pushNamed("/users");
          },
        ),
        ListTile(
          title: Text(
            'Settings',
            style: TextStyle(
                color: greencolor, fontStyle: FontStyle.italic, fontSize: 20),
          ),
          trailing: Icon(Icons.arrow_forward, color: greencolor),
          onTap: () {
            Navigator.of(context).pushNamed("/settings");
          },
        ),
        ListTile(
          title: Text(
            'Contact Us',
            style: TextStyle(
                color: greencolor, fontStyle: FontStyle.italic, fontSize: 20),
          ),
          trailing: Icon(Icons.arrow_forward, color: greencolor),
          onTap: () {
             Navigator.of(context).pushNamed("/helpcenter");
          },
        ),
        ListTile(
          title: Text(
            'Logout',
            style: TextStyle(
                color: greencolor, fontStyle: FontStyle.italic, fontSize: 20),
          ),
          trailing: Icon(Icons.arrow_forward, color: greencolor),
          onTap: () async {
            /* bool signoutSuccess = await AuthProvider().logOut();

            if (signoutSuccess)*/
            Navigator.of(context).pushNamedAndRemoveUntil(
                '/login', (Route<dynamic> route) => false);
            /*  else {
              print("Error in SignOut.");
            }*/
          },
        ),
      ]),
    );
  }

  Widget imagepostUI(String image) {
    return Container(
        height: 180,
        width: 180,
        child: CircleAvatar(
          child: Image.network(image, fit: BoxFit.fill),
        ));
  }
}
