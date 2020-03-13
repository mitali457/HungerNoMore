import 'package:flutter/material.dart';


import 'package:newapp/Utils/colors.dart';
import 'package:newapp/Utils/images.dart';

import 'package:newapp/Widget/Bottomnavigationbar.dart';

import 'package:newapp/Widget/Drawer.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Homescreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomescreenState();
  }
}

class _HomescreenState extends State<Homescreen> {
  final TextEditingController _nameFilter = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   CategoriesList categoriesList;
  // RestaurantList resto;
  //String restaurantsname;
  //bool loader = true;
  SharedPreferences sharedPreferences;
  String name;
  String email;

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
      name = sharedPreferences.getString("name");
    });
  }

  // _getcategories() async {
  //   categoriesList = await  CategoryService.getCategories();
  //   print("categories in home ${categoriesList?.category[0].categories.id}");

  //   setState(() {});
//   }
  // _getrestaurants() async {
  //   resto = await cityService.getRestuarants();
  //   print('resto $resto');
  //   setState(() {
  //     loader = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    // if (loader)
    //return Scaffold(body: Center(child: CircularProgressIndicator()));
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(children: <Widget>[
          SizedBox(
            height: 5,
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Container(
          //     decoration: BoxDecoration(
          //         color: Colors.white,
          //         borderRadius: BorderRadius.circular(5),
          //         boxShadow: [
          //           BoxShadow(
          //               color: Colors.grey[300],
          //               offset: Offset(2, 1),
          //               blurRadius: 5)
          //         ]),
          //     child: ListTile(
          //       leading: Icon(
          //         Icons.search,
          //         color: Colors.green,
          //       ),
          //       title: TextField(
          //         decoration: InputDecoration(
          //             hintText: "Find Nearby Restuarant ",
          //             border: InputBorder.none),
          //       ),
          //       trailing: Icon(
          //         Icons.filter_list,
          //         color: Colors.green,
          //       ),
          //     ),
          //   ),
          // ),

          // Expanded(
          //               child: ListView.builder(
          //       itemCount: resto.restaurants.length,
          //       itemBuilder: (BuildContext context, int index) {
          //         print(resto.restaurants.length);
          //          return GestureDetector(
          //             onTap: () {
          //               // Navigator.push(
          //               // context,
          //               // MaterialPageRoute(
          //               //     builder: (context) => MyHomePage()));

          //             },
          //         child:ListTile(
          //          leading:
          //               Image.network(resto.restaurants[index].restaurant.url),
          //           title: Text(resto.restaurants[index].restaurant.name),
          //          ));
          //       }),
          // ),

          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Container(
                margin: EdgeInsets.only(top: 20, bottom: 15.0, left: 60),
                width: 120,
                child: foodimage1inhomescreen),
            Container(
              padding: EdgeInsets.all(6),
              height: 140,
              width: 150,
              decoration: BoxDecoration(),
              child: FlatButton(
                  color: Colors.white,
                  child: Text("Yauatcha Bengaluru  ",
                      textAlign: TextAlign.center,
                      //textDirection: TextDirection.rtl,
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold)),
                  onPressed: () {
                    Navigator.of(context).pushNamed("/restaurantname");
                  }),
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Container(
                margin: EdgeInsets.only(top: 20, bottom: 15.0, left: 60),
                width: 120,
                child: foodimage2inhomescreen),
            Container(
              padding: EdgeInsets.all(6),
              height: 140,
              width: 150,
              decoration: BoxDecoration(),
              child: FlatButton(
                  color: Colors.white,
                  child: Text("Jalsa Restaurant - Celebrating Food and Love  ",
                      textAlign: TextAlign.center,
                      //textDirection: TextDirection.rtl,
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold)),
                  onPressed: () {
                     Navigator.of(context).pushNamed("/restaurantname");
                  }),
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Container(
                margin: EdgeInsets.only(top: 20, bottom: 15.0, left: 60),
                width: 120,
                child: foodimage3inhomescreen),
            Container(
              padding: EdgeInsets.all(6),
              height: 140,
              width: 150,
              decoration: BoxDecoration(),
              child: FlatButton(
                  color: Colors.white,
                  child: Text("Ebony Restaurant  ",
                      textAlign: TextAlign.center,
                      //textDirection: TextDirection.rtl,
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold)),
                  onPressed: () {
                    Navigator.of(context).pushNamed("/restaurantname");
                  }),
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Container(
                margin: EdgeInsets.only(top: 20, bottom: 15.0, left: 60),
                width: 120,
                child: foodimage4inhomescreen),
            Container(
              padding: EdgeInsets.all(6),
              height: 140,
              width: 150,
              decoration: BoxDecoration(),
              child: FlatButton(
                  color: Colors.white,
                  child: Text("Raj Pavilion ",
                      textAlign: TextAlign.center,
                      //textDirection: TextDirection.rtl,
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold)),
                  onPressed: () {
                    Navigator.of(context).pushNamed("/restaurantname");
                  }),
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Container(
                margin: EdgeInsets.only(top: 20, bottom: 15.0, left: 60),
                width: 120,
                child: foodimage5inhomescreen),
            Container(
              padding: EdgeInsets.all(6),
              height: 140,
              width: 150,
              decoration: BoxDecoration(),
              child: FlatButton(
                  color: Colors.white,
                  child: Text("Caprese ",
                      textAlign: TextAlign.center,
                      //textDirection: TextDirection.rtl,
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold)),
                  onPressed: () {
                     Navigator.of(context).pushNamed("/restaurantname");
                  }),
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Container(
                margin: EdgeInsets.only(top: 20, bottom: 15.0, left: 60),
                width: 120,
                child: foodimage6inhomescreen),
            Container(
              padding: EdgeInsets.all(6),
              height: 140,
              width: 150,
              decoration: BoxDecoration(),
              child: FlatButton(
                  color: Colors.white,
                  child: Text("Vidyarthi Bhavan",
                      textAlign: TextAlign.center,
                      //textDirection: TextDirection.rtl,
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold)),
                  onPressed: () {
                    Navigator.of(context).pushNamed("/restaurantname");
                  }),
            ),
          ]),
        ]),
      ),
      appBar: AppBar(
        title: Text(
          ("HuNgEr No MoRe"),
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 3,
            //height: 2
          ),
        ),
        backgroundColor: greencolor,
        automaticallyImplyLeading: false,
        leading: IconButton(
            icon: Icon(
              Icons.menu,
            ),
            onPressed: () {
              _scaffoldKey.currentState.openDrawer();
            },
            color: Colors.white),
      ),
      drawer: CustomDrawer(email: email),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
