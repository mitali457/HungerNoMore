
import 'package:flutter/material.dart';
import 'package:newapp/FoodApp_Screen/Login.dart';


import 'package:newapp/Widget/CustomShapeBorder.dart';
import 'package:newapp/services/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _confirmpasswordController = TextEditingController();

  String _name;
  String _email;
  String _password;
  String _confirmpassword;
  SharedPreferences sharedPreferences;
  

  bool _obscureText = true;
  //  _getName() async {
  //   sharedPreferences = await SharedPreferences.getInstance();
  //   setState(() {
  //   _name = sharedPreferences.getString("name");
  //   });
  // }
  validateFromAndLogin() {
    print('Validating From...');
    if (formKey.currentState.validate()) {
      print('validation sucessfully!!');
      formKey.currentState.save();
      print('enter the name $_name');
      print('enter the email $_email');
      print('enter the password $_password');
      print('enter the password $_confirmpassword');
    } else {
      print('validation Error');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.green,
          shape: CustomShapeBorder(),
          actions: <Widget>[
            Padding(padding:EdgeInsets.only(top: 20, left: 15, right: 15), )
          ],
          title:Text(
                  "HuNgEr No MoRe...",
                  textDirection: TextDirection.ltr,
                   textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 22),
                )
        ),
           

          
        
       
       
        body: SingleChildScrollView(
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      width: 350,
                      height: 400,
                      margin: EdgeInsets.only(top: 140, bottom: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow:  [
                          BoxShadow(
                            color: Color.fromRGBO(25, 250, 37, .3),
                            blurRadius: 20,
                          )
                        ]),
                        
                      child: Column(children: <Widget>[
                        Padding(
                          padding:
                              EdgeInsets.only(top: 10, left: 15, right: 15),
                          child: Form(
                            key: formKey,
                            child: Column(children: [
                              TextFormField(
                                controller: _nameController,
                                decoration: InputDecoration(
                                  labelText: 'Enter Your Name',
                                  icon: Icon(
                                    Icons.person,
                                    color: Colors.green,
                                  ),
                                ),
                                validator: (val) =>
                                    val.length < 8 ? 'Not a valid Name.' : null,
                                onSaved: (val) => _name = val,
                              ),
                              TextFormField(
                                controller: _emailController,
                                decoration: InputDecoration(
                                    labelText: 'Enter Your Email',
                                    icon: Icon(Icons.email,
                                       color: Colors.green)),
                                validator: (val) => !val.contains('@')
                                    ? 'Not a valid email.'
                                    : null,
                                onSaved: (val) => _email = val,
                              ),
                              TextFormField(
                                obscureText: _obscureText,
                                controller: _passwordController,
                                decoration: InputDecoration(
                                    labelText: 'Password',
                                    icon: Icon(Icons.lock_outline,
                                        color: Colors.green),
                                    suffixIcon: new GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _obscureText = !_obscureText;
                                        });
                                      },
                                      child: new Icon(_obscureText
                                          ? Icons.visibility_off
                                          : Icons.visibility),
                                    )),
                                validator: (val) => val.length < 5
                                    ? 'Password too short.'
                                    : null,
                                onSaved: (val) => _password = val,
                              ),
                              TextFormField(
                                obscureText: _obscureText,
                                controller: _confirmpasswordController,
                                decoration: InputDecoration(
                                    labelText: ' Confirm Password',
                                    icon: Icon(Icons.lock_outline,
                                        color: Colors.green),
                                    suffixIcon: new GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _obscureText = !_obscureText;
                                        });
                                      },
                                      child: new Icon(_obscureText
                                          ? Icons.visibility_off
                                          : Icons.visibility),
                                    )),
                                validator: (val) => val.length < 5
                                    ? 'Password too short.'
                                    : null,
                                onSaved: (val) => _password = val,
                              ),
                            ]),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(top: 30, left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                width: 100,
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                 
                                ),
                                child: FlatButton(
                                  shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(40.0),
        
),

                                  color: Colors.green,
                                  onPressed: () async
                                   {
                                    validateFromAndLogin();
                                    // if (_passwordController.text ==
                                    //     _confirmpasswordController.text) {
                               

                            
                                    if (_emailController.text.isEmpty ||
                                        _passwordController.text.isEmpty) {
                                      print(_emailController.text);
                                      print(_passwordController.text);
                                      print('Email and Password can not Empty');
                                      return;
                                    }
                                    bool res = await AuthProvider()
                                        .createUserWithNewEmail(
                                            _emailController.text,
                                            _passwordController.text);
                                    if (!res) {
                                      // print(
                                      //     'Already Registerd Your Account!\nPlease Login');
                                    //   scaffoldKey.currentState.showSnackBar(
                                    //       new SnackBar(
                                    //           content: new Text(
                                    //               "Already Registerd Your Account!\nPlease Login")));
                                    } else
                                    
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Login()));
                                  },
                                  child: Text(
                                    'Register',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Container(
                                width: 150,
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                 
                                ),
                                child: FlatButton(
                                  shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(40.0),
        
),

                                  color: Colors.green,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Login()));
                                  },
                                  child: Text(' Go To LoginPage',
                                      style: TextStyle(
                                          color: Colors.white,
                                          //fontSize: 10,
                                          fontWeight: FontWeight.bold)),
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
