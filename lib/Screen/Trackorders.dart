import 'package:flutter/material.dart';
import 'package:newapp/Utils/colors.dart';
import 'package:newapp/Widget/timeline.dart';

class Trackorder extends StatefulWidget {
  static String tag = 'Trackorder';
  @override
  _TrackorderState createState() => _TrackorderState();
}

class _TrackorderState extends State<Trackorder> {
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          //backgroundColor:  greencolor,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.chevron_left,
              size: 40.0,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.home,
                color: Colors.white,
                size: 30.0,
              ),
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/homescreen', (Route<dynamic> route) => false);
              },
            )
          ],
          title: Text('Track My Order',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600)),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: width,
            height: height,
            //color: Colors.white,
            child: Stack(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 20.0, top: 20.0),
                          child: Text('Mon,25 Nov',
                              style: TextStyle(
                                  color: greencolor,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400)),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 20.0, top: 10.0),
                          child: Text('Order ID: 25GaAr',
                              style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400)),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                            right: 20.0,
                          ),
                          child: Text('Amt.150.00',
                              style: TextStyle(
                                  color: greencolor,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500)),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 20.0, top: 10.0),
                          child: Text('ETA: 20 min',
                              style: TextStyle(
                                  color: greencolor,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500)),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 20.0, top: 10.0),
                          child: Text('Product quantity: Paratha 2 pices',
                              style: TextStyle(
                                  color: greencolor,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w300)),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 20.0, top: 10.0),
                          child: Text('Order rate: Rs.350',
                              style: TextStyle(
                                  color: greencolor,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500)),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        InkWell(
                            onTap: () {},
                            child: Padding(
                              padding: EdgeInsets.only(left: 20.0, top: 10.0),
                              child: Text('View Product details',
                                  style: TextStyle(
                                      color: greencolor,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w300)),
                            ))
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(top: 80.0),
                        child: Timeline(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.all(20.0),
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.green[50],
                                  borderRadius: BorderRadius.circular(40)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text('Order Successful',
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              color: greencolor,
                                              fontWeight: FontWeight.w500)),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(20.0),
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.green[50],
                                  borderRadius: BorderRadius.circular(40)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text('Order Accepted',
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              color: greencolor,
                                              fontWeight: FontWeight.w500)),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(20.0),
                              height: 50,
                              decoration: BoxDecoration(
                                  color:Colors.green[700],
                                  borderRadius: BorderRadius.circular(40)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text('Order Dispatched',
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500)),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(20.0),
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.green[50],
                                  borderRadius: BorderRadius.circular(40)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text('Order Delivered',
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              color: greencolor,
                                              fontWeight: FontWeight.w500)),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                          indicators: <Widget>[
                            Icon(
                              Icons.check_circle_outline,
                              color: greencolor,
                              size: 34.0,
                            ),
                            Icon(
                              Icons.access_time,
                              color: greencolor,
                              size: 34.0,
                            ),
                            Icon(
                              Icons.local_shipping,
                              color: greencolor,
                              size: 34.0,
                            ),
                            Icon(
                              Icons.description,
                              color: greencolor,
                              size: 34.0,
                            ),
                          ],
                        )),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
