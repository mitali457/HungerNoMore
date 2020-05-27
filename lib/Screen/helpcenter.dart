import 'package:flutter/material.dart';
import 'package:newapp/Utils/images.dart';
import 'package:newapp/Widget/customShapeBorder.dart';

class HelpCenter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('HelpCenter'),
          shape: CustomShapeBorder(),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 10),
          child: Row(
            children: <Widget>[
              Container(
                height: height / 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 2),
                      child: Text(
                          '  Help Center\n please get in touch & \n we will be happy to help you!',
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.blueGrey,
                          )),
                    ),
                    SizedBox(width: 5),
                    Container(
                        width: 170,
                        height: height / 4,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: helpimage, fit: BoxFit.cover),
                        ))
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
