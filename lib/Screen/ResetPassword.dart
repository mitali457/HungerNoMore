

import 'package:flutter/material.dart';
import 'package:newapp/Services/firebase_auth.dart';
import 'package:newapp/Utils/String.dart';

import 'package:newapp/Utils/colors.dart';
import 'package:newapp/Utils/images.dart';




class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPassword> {
  final formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  String _email;
  validateFromAndLogin() {
    print('Validating From...');
    if (formKey.currentState.validate()) {
      print('validation sucessfully!!');
      formKey.currentState.save();
      print('enter the email $_email');
    } else {
      print('validation Error');
    }
  }

  void message() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Reset Password',
            style: TextStyle(
                      
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color:greencolor,
                        )),
            content: const Text(
                ' Check Your Email\n Follow The link for your reset \npassword..',
                 textAlign: TextAlign.center,
                style: TextStyle(
                      
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color:Colors.black,
                        )),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok',style: TextStyle(
                      
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color:greencolor,
                        )),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(260.0),
          child: AppBar(
            flexibleSpace: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(padding: EdgeInsets.only(left:20),
                child:Text('Forgot Password',
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
            style: TextStyle(
                      
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color:greencolor,
                        )),
                ),
                
           Container(
             margin: EdgeInsets.only(top:60,left: 10,right: 10),
             width:150,
             height:200,
             decoration:BoxDecoration(
               image: DecorationImage(image: resetpasswordimage,
               fit:BoxFit.cover
               ),
             borderRadius: BorderRadius.circular(40)
             )
           )
                 
              ],
            ),
          
            elevation: 0.0,
            backgroundColor: Colors.white,
            brightness: Brightness.light,
            actions: <Widget>[
            
            // SizedBox(height: 35,) ,
            ]
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
          child: ListView(
          children: <Widget>[

          Container(
            padding: const EdgeInsets.only(top: 20, left: 40, right: 30),
            width: 200,
                   
                      color: Colors.white,
                    ),
                     Text(resetpasswordtext,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color:Colors.blueGrey,
                        )
              

          ),

          Padding(
            padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
            child: Column(
                    children: <Widget>[
                      SizedBox(height: 60,),
                    Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [BoxShadow(
                            color: Color.fromRGBO(25, 250, 37, .3),
                            blurRadius: 10,
                            offset: Offset(0, 10)
                          )]
                        ),
            child: Form(
              key: formKey,
              child: Column
              (
                children:<Widget> [
                Container(
                  decoration: BoxDecoration(
                    // border: Border(bottom:BorderSide(color: Colors.black)
                    // )
                    ),

                  

                child:TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                
                    labelText: 'Enter your Registered Email',
                    icon: Padding(padding: EdgeInsets.only(left:10),child:Icon(Icons.email, color: greencolor),)
                  ),
                  validator: (val) =>
                      !val.contains('@') ? 'Not a valid email.' : null,
                  onSaved: (val) => _email = val,
                )
                ),
              ]
              ),
            ),
                    ),
                    ]
            ),
          ),
            
              
            

               Container(
                 width:400,
                 child: Padding(
                  padding: EdgeInsets.only(top: 50, left: 50, right: 50),
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(40.0),
        
),

                    color: greencolor,
                    onPressed: () async {
                      message();
                      AuthenticationService()
                          .sendPasswordResetEmail(_emailController.text);
                    },
                    child: Text(
                      "Send",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
               ),
              
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                  child: Container(
                    width: 200,
                    height: 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.blue,
                    ),
                    child: FlatButton(
                      color: Colors.white,
                      onPressed: () {
                        Navigator.of(context).pushNamed("/login");
                      },
                      child: Text(' Return To LoginPage!!',
                          style: TextStyle(
                              color: Colors.blueGrey,
                              //fontSize: 10,
                              fontWeight: FontWeight.w400)),
                    ),
                  ),
                )
              ]),
        ),
            );
          
   
  }
}
