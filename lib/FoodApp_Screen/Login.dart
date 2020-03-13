import 'package:flutter/material.dart';

import 'package:newapp/FoodApp_Screen/ResetPassword.dart';
import 'package:newapp/Utils/colors.dart';
import 'package:newapp/Utils/images.dart';

import 'package:newapp/services/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<Login> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String _email;
  String _password;
  bool _obscureText = true;
  bool checkValue = false;
  SharedPreferences sharedPreferences;
  @override
  void initState() {
    super.initState();
    setData();
  }

  validateFromAndLogin() {
    print('Validating From...');
    if (formKey.currentState.validate()) {
      print('validation sucessfully!!');
      formKey.currentState.save();
      print('enter the email $_email');
      print('enter the password $_password');
    } else {
      print('validation Error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:scaffoldKey,
      body: Container(
      
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          greencolor,
          greencolor,
          Colors.white
        ])),
        child: ListView(children: <Widget>[

           SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                (Text(
                  "HuNgEr No MoRe",
                  style: TextStyle(color: Colors.white, fontSize: 40),
                )),
                SizedBox(
                  height: 10,
                ),
                (Text(
                  "Welcome Back",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )),
              ],
            ),
          ),

          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60))),

            child: Padding(
              padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
              child:Column(children: <Widget>[
                 
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(25, 250, 37, .3),
                            blurRadius: 20,
                          )
                        ]),
                    child: Padding(padding: EdgeInsets.only(right: 10,left:10,
                    
                    ),
                    child:Form(
                      key: formKey,
                      child: Column(children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.blueGrey))),
                          child: TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Email',
                              icon: Icon(Icons.email, color: greencolor),
                            ),
                            validator: (val) => !val.contains('@')
                                ? 'Not a valid email.'
                                : null,
                            onSaved: (val) => _email = val,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.grey[200]))),
                          child: TextFormField(
                            obscureText: _obscureText,
                            controller: _passwordController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Password',
                                icon: Icon(Icons.lock_outline,
                                    color: greencolor),
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
                            validator: (val) =>
                                val.length < 6 ? 'Password too short.' : null,
                            onSaved: (val) => _password = val,
                          ),
                        ),
                      ]),
                    ),
                    )
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 0.0),
                      child: FlatButton(
                        color: Colors.white,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ResetPassword()));
                        },
                        child: Text(
                          "Forgot Password??",
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 17.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  new CheckboxListTile(
                    value: checkValue,
                    onChanged: _onChanged,
                    title: new Text("Remember me",style: TextStyle(color:Colors.blueGrey),),
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                  Container(
                    width: 300,
                    child: Padding(
                        padding: EdgeInsets.only(top: 5, left: 10, right: 10),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(40.0),
                          ),
                          color: greencolor,
                          onPressed: () async {
                            validateFromAndLogin();
                            if (_emailController.text.isEmpty ||
                                _passwordController.text.isEmpty) {
                              print('Email and Password can not Empty');
                              return;
                            }
                            bool res = await AuthProvider().signInWithEmail(
                                _emailController.text,
                                _passwordController.text);

                            if (!res) {
                              print(
                                  'New user?? Please Register your New Account');
                              scaffoldKey.currentState.showSnackBar(new SnackBar(
                                  content: new Text(
                                      "No user Found! Please Register your New Account")));
                            } else
                              Navigator.of(context).pushNamed("/homescreen");
                          },
                          child: new Text('Login',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        )),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: Text(
                      '- OR -',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin:
                              EdgeInsets.only(top: 20, bottom: 15.0, left: 60),
                          width: 120,
                          child: Text("Sign in with  ",
                              textAlign: TextAlign.center,
                              //textDirection: TextDirection.rtl,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 7, left: 1, right: 27),
                          height: 40,
                          width: 60,
                          decoration: BoxDecoration(),
                          child: FlatButton(
                            color: Colors.white,
                            child: googlelogoinloginscreen,
                            onPressed: () async {
                              bool res = await AuthProvider().loginWithGoogle();
                              if (!res) print("error logging in with ");
                            },
                          ),
                        ),
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          margin:
                              EdgeInsets.only(top: 14, bottom: 15.0, left: 30),
                          child: Text("Don't have an account?",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.w600)),
                        ),
                        Container(
                          width: 100,
                          height: 39,
                          decoration: BoxDecoration(),
                          child: FlatButton(
                            color: Colors.white,
                            onPressed: () {
                              Navigator.of(context).pushNamed("/register");
                            },
                            child: Text('Sign Up',
                                style: TextStyle(
                                    color: greencolor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ])
                ]),)), 
          
        ]),
      ),
    );

    
  }

  _onChanged(bool value) async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      checkValue = value;
      sharedPreferences.setBool("check", checkValue);
      sharedPreferences.setString("username", _emailController.text);
      sharedPreferences.setString("password", _passwordController.text);

      setData();
    });
  }

  setData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      checkValue = sharedPreferences.getBool("check");
      if (checkValue != null) {
        if (checkValue) {
          _emailController.text = sharedPreferences.getString("username");
          _passwordController.text = sharedPreferences.getString("password");
        } else {
          _emailController.text = "";
          _passwordController.text = "";
          sharedPreferences.clear();
        }
      } else {
        checkValue = false;
      }
    });
  }
}
