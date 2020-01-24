import 'dart:math';

import 'package:flutter/material.dart';
import 'package:newapp/Screen/Login.dart';
import 'package:newapp/Screen/Registration.dart';

class Homescreen extends StatefulWidget  {
  @override
  State<StatefulWidget> createState() {
    return _HomescreenState();
  }
}
class _HomescreenState extends State<Homescreen > {
  List FoodItem = [
    NetworkImage(
        'http://www.pngall.com/wp-content/uploads/2016/06/Junk-Food-PNG-Picture.png'),
    NetworkImage(
        'http://itsmybiryani.com/uploads/product_image/product_127_1.jpg'),
    NetworkImage(
        'https://img.pngio.com/foods-png-transparent-foodspng-images-pluspng-foods-png-352_251.png'),
    NetworkImage(
        'https://content3.jdmagicbox.com/comp/kolkata/48/033pf002148/catalogue/sholo-ana-bangali-jodhpur-park-kolkata-home-delivery-restaurants-1ej97et.png'),
    NetworkImage(
        'http://www.bezawadabhojanam.com/wp-content/uploads/bfi_thumb/SOUTH-INDIAN-IDLY-WADA-CAMBO-n6fnmry51ihd6vhcgyzx8gxykqrdgk3qwtl9fvm7c2.png')
  ];
  List msg = [
    'EnJoy your day with your NoMoReHuNgEr Dishes ',
    'EnJoy your day with Excellent Food',
    'EnJoyt your day with Beautifull Lunch',
    'EnJoy your day with Your Favorite Dishes',
    'EnJoy your day with Delicious Food',
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 30),
                    width: 350,
                    height: 300,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(
                          image: FoodItem[index],
                        )),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 300,
                    child: Text(msg[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.teal,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3,
                            height: 2)),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.all(24),
                width: 130,
                child: RaisedButton(
                  color: Colors.pink,
                  onPressed: () {
                    setState(() {
                       index = Random().nextInt(5);
                                        });
                                      },
                                      child: Text(
                                        'Click Here',
                                        style: TextStyle(fontSize: 18, color: Colors.white),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          backgroundColor: Colors.white,
                          appBar: PreferredSize(
                            preferredSize: Size.fromHeight(260.0),
                            child: AppBar(
                              flexibleSpace: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  //
                                  Image.network(
                                    'http://www.hungernomore.ca/images/HNM-Logo.png',
                                    fit: BoxFit.contain,
                                    width: 300,
                                    height: 320,
                                  ),
                                ],
                              ),
                              elevation: 0.0,
                              backgroundColor: Colors.white,
                              brightness: Brightness.light,
                            ),
                          ),
                          
                        );
                      }
                    
                     
}
