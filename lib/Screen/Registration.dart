import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newapp/Screen/Homescreen.dart';
class Registration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar:PreferredSize(
                            preferredSize: Size.fromHeight(260.0),
                            child: AppBar(
                              flexibleSpace: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  //
                                  Image.network(
                                    'http://blogs.volunteermatch.org/engagingvolunteers/wp-content/uploads/2012/01/Hunger-300x208.jpg',
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
        body: SingleChildScrollView(
        child: Center(
         child: 
         Column(mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                  Container(
                    width: 350,
                        height: 300,
                        margin: EdgeInsets.only(top: 10, bottom: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          //boxShadow: [BoxShadow(color: Colors.blue, blurRadius: 2)],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 10, left: 15, right: 15),
                            child: TextField(
                             // controller: Controller,
                          keyboardType: TextInputType.text,
                          inputFormatters: <TextInputFormatter>[WhitelistingTextInputFormatter(RegExp("[a-zA-Z]")),],
            
                              decoration: InputDecoration(
                                hintText: ' Enter Your Name',
                                icon: Icon(Icons.person, color: Colors.blue),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10, left: 15, right: 15),
                            child: TextField(
                              //controller: Controller,
                          keyboardType: TextInputType.emailAddress,
                          
                              decoration: InputDecoration(
                                hintText: ' Enter Your Email',
                                icon: Icon(Icons.email, color: Colors.blue),
                              ),
                            ),
                          ),
                          
                     
                      Padding(
                        padding: EdgeInsets.only(top: 10, left: 15, right: 15),
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: ' password',
                            icon: Icon(Icons.lock_outline, color: Colors.blue),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10, left: 15, right: 15),
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: '  Confirm password',
                            icon: Icon(Icons.lock_outline, color: Colors.blue),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 40, left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              width: 100,
                              height: 22,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.blue,
                              ),
                              child: FlatButton(
                                onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Homescreen()));  
                                },
                                child: Text(
                                  'Register',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ])),
              ],
            )
          ],
    )),
      ));
      
    
  }
}