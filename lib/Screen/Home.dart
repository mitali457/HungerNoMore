import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';


import 'package:newapp/Utils/images.dart';

import 'package:newapp/Widget/Drawer.dart';



class Homescreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomescreenState();
  }
}

class _HomescreenState extends State<Homescreen> {
  final TextEditingController nameFilter = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    //double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    // if (loader)
    //return Scaffold(body: Center(child: CircularProgressIndicator()));
    return Scaffold(
      key: _scaffoldKey,
      //backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Container(
                height: height / 4.8,
                // color: Colors.white,
                child: CarouselSlider(
                  height: height / 4.8,
                  autoPlay: true,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlayInterval: Duration(seconds: 2),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  pauseAutoPlayOnTouch: Duration(seconds: 2),
                  items: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                          //boxShadow: [BoxShadow(color: Colors.blueGrey,blurRadius: 4.0)],
                          borderRadius: BorderRadius.circular(5.0),
                          image: DecorationImage(
                              image: AssetImage('images/food10.png'),
                              fit: BoxFit.cover)),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                          //boxShadow: [BoxShadow(color: Colors.blueGrey,blurRadius: 4.0)],
                          borderRadius: BorderRadius.circular(5.0),
                          image: DecorationImage(
                              image: AssetImage('images/food7.png'),
                              fit: BoxFit.cover)),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          // boxShadow: [BoxShadow(color: Colors.blueGrey[50],blurRadius: 4.0)],
                          image: DecorationImage(
                              image: AssetImage('images/food8.png'),
                              fit: BoxFit.cover)),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          //boxShadow: [BoxShadow(color: Colors.blueGrey,blurRadius: 2.0)],
                          image: DecorationImage(
                              image: AssetImage('images/food9.png'),
                              fit: BoxFit.cover)),
                    )
                  ],
                )),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Container(
                margin: EdgeInsets.only(top: 20, bottom: 15.0),
                width: 120,
                child: foodimage1inhomescreen),
            Container(
              padding: EdgeInsets.all(6),
              height: 140,
              width: 150,
              decoration: BoxDecoration(),
              child: FlatButton(
                  //color: Colors.white,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center, 
            children: <Widget>[
            Container(
                margin: EdgeInsets.only(
                  top: 20,
                  bottom: 15.0,
                ),
                width: 120,
                child: foodimage2inhomescreen),
            Container(
              padding: EdgeInsets.all(6),
              height: 140,
              width: 150,
              decoration: BoxDecoration(),
              child: FlatButton(
                  //color: Colors.white,
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
                margin: EdgeInsets.only(
                  top: 20,
                  bottom: 15.0,
                ),
                width: 120,
                child: foodimage3inhomescreen),
            Container(
              padding: EdgeInsets.all(6),
              height: 140,
              width: 150,
              decoration: BoxDecoration(),
              child: FlatButton(
                  //color: Colors.white,
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
                margin: EdgeInsets.only(
                  top: 20,
                  bottom: 15.0,
                ),
                width: 120,
                child: foodimage4inhomescreen),
            Container(
              padding: EdgeInsets.all(6),
              height: 140,
              width: 150,
              decoration: BoxDecoration(),
              child: FlatButton(
                  //color: Colors.white,
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
                margin: EdgeInsets.only(
                  top: 20,
                  bottom: 15.0,
                ),
                width: 120,
                child: foodimage5inhomescreen),
            Container(
              padding: EdgeInsets.all(6),
              height: 140,
              width: 150,
              decoration: BoxDecoration(),
              child: FlatButton(
                  //color: Colors.white,
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
                margin: EdgeInsets.only(
                  top: 20,
                  bottom: 15.0,
                ),
                width: 120,
                child: foodimage6inhomescreen),
            Container(
              padding: EdgeInsets.all(6),
              height: 140,
              width: 150,
              decoration: BoxDecoration(),
              child: FlatButton(
                  // color: Colors.white,
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
      drawer: CustomDrawer(),
      // bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
