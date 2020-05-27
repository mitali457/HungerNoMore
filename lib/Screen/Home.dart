import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';

import 'package:newapp/Widget/drawer.dart';
import 'package:newapp/Widget/bestfoodwidget.dart';
import 'package:newapp/Widget/popularfoodwidget.dart';

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
        appBar: AppBar(
          centerTitle: true,
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
        //backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(children: <Widget>[
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
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed("/menu");
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                                //boxShadow: [BoxShadow(color: Colors.blueGrey,blurRadius: 4.0)],
                                borderRadius: BorderRadius.circular(5.0),
                                image: DecorationImage(
                                    image: AssetImage('images/food10.png'),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed("/menu");
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                                //boxShadow: [BoxShadow(color: Colors.blueGrey,blurRadius: 4.0)],
                                borderRadius: BorderRadius.circular(5.0),
                                image: DecorationImage(
                                    image: AssetImage('images/food7.png'),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed("/menu");
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                // boxShadow: [BoxShadow(color: Colors.blueGrey[50],blurRadius: 4.0)],
                                image: DecorationImage(
                                    image: AssetImage('images/food8.png'),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed("/menu");
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                //boxShadow: [BoxShadow(color: Colors.blueGrey,blurRadius: 2.0)],
                                image: DecorationImage(
                                    image: AssetImage('images/food9.png'),
                                    fit: BoxFit.cover)),
                          ),
                        )
                      ],
                    )),
              ),
              SizedBox(height: 20),
              Column(
                children: <Widget>[
                  // TopMenus(),
                  PopularFoodsWidget(),
                  BestFoodWidget(),
                ],
              ),
            ]),
          ),

          // bottomNavigationBar: CustomBottomNavigationBar(),
        ));
  }
}
