import 'package:flutter/material.dart';
import 'package:newapp/FoodApp_Screen/Cart.dart';
import 'package:newapp/FoodApp_Screen/Homescreen.dart';
import 'package:newapp/Utils/colors.dart';


class CustomDrawer extends StatelessWidget {
  final String email;
  //final String name;
  CustomDrawer({this.email});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(padding: EdgeInsets.zero, children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text(""),
          accountEmail: Text(
            email,
            style: TextStyle(
                color: Colors.white,
                fontSize: 17.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold),
          ),
          decoration: BoxDecoration(
            color: greencolor,
          ),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Theme.of(context).platform == TargetPlatform.iOS
                ? Colors.white
                : Colors.white,
            child: Text(
              "LOGIN",
              style: TextStyle(
                  color: greencolor,
                  fontSize: 17.0,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        ListTile(
          title: Text('Home',
              style: TextStyle(
                  color: greencolor,
                  fontStyle: FontStyle.italic,
                  fontSize: 20)),
          trailing: Icon(Icons.arrow_forward, color: greencolor),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Homescreen()));
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
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => User()));
          },
        ),
        ListTile(
          title: Text(
            'Cart',
            style: TextStyle(
                color: greencolor, fontStyle: FontStyle.italic, fontSize: 20),
          ),
          trailing: Icon(Icons.arrow_forward, color: greencolor),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Cart()));
          },
        ),
        ListTile(
          title: Text(
            'Search',
            style: TextStyle(
                color: greencolor, fontStyle: FontStyle.italic, fontSize: 20),
          ),
          trailing: Icon(Icons.arrow_forward, color: greencolor),
          onTap: () {},
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
}
