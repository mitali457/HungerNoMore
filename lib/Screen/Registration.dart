import 'package:flutter/material.dart';
import 'package:newapp/Provider/signup_provider.dart';

import 'package:newapp/Utils/colors.dart';

import 'package:newapp/Widget/CustomShapeBorder.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  String _name;
  String _email;
  String _password;
  String _confirmpassword;
  bool _obscureText = true;
  bool checkValue = false;
  SharedPreferences sharedPreferences;
  @override
  void initState() {
    super.initState();
    setData();
  }

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
            //backgroundColor: greencolor,
            shape: CustomShapeBorder(),
            actions: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 20, left: 15, right: 15),
              )
            ],
            title: Text(
              "HuNgEr No MoRe...",
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 22),
            )),
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
                      decoration:
                          BoxDecoration(color: Colors.white, boxShadow: [
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
                                controller: name,
                                decoration: InputDecoration(
                                  labelText: 'Enter Your Name',
                                  icon: Icon(
                                    Icons.person,
                                    color: greencolor,
                                  ),
                                ),
                                validator: (val) =>
                                    val.length < 8 ? 'Not a valid Name.' : null,
                                onSaved: (val) => _name = val,
                              ),
                              TextFormField(
                                controller: email,
                                decoration: InputDecoration(
                                    labelText: 'Enter Your Email',
                                    icon: Icon(Icons.email, color: greencolor)),
                                validator: (val) => !val.contains('@')
                                    ? 'Not a valid email.'
                                    : null,
                                onSaved: (val) => _email = val,
                              ),
                              TextFormField(
                                obscureText: _obscureText,
                                controller: password,
                                decoration: InputDecoration(
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
                                validator: (val) => val.length < 5
                                    ? 'Password too short.'
                                    : null,
                                onSaved: (val) => _password = val,
                              ),
                              TextFormField(
                                obscureText: _obscureText,
                                controller: confirmpassword,
                                decoration: InputDecoration(
                                    labelText: ' Confirm Password',
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
                                    borderRadius:
                                        new BorderRadius.circular(40.0),
                                  ),
                                  color: greencolor,
                                  onPressed: () async {
                                    validateFromAndLogin();
                                    onPressedRegistration(
                                        context, email, password, name);
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
                                    borderRadius:
                                        new BorderRadius.circular(40.0),
                                  ),
                                  color: greencolor,
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushReplacementNamed("/login");
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

  onChanged(bool value) async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      checkValue = value;
      //sharedPreferences.setBool("check", checkValue);
      //sharedPreferences.setString("username", email.text);
      print(name.text);

      sharedPreferences.setString("name", name.text);
      print("name************** ${sharedPreferences.getString("name")}");
      setData();
    });
  }

  setData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      checkValue = sharedPreferences.getBool("check");
      if (checkValue != null) {
        if (checkValue) {
          // email.text = sharedPreferences.getString("username");
          // password.text = sharedPreferences.getString("password");
          name.text = sharedPreferences.getString("name");
        } else {
          name.text = "";

          sharedPreferences.clear();
        }
      } else {
        checkValue = false;
      }
    });
  }
}
