import 'package:flutter/material.dart';
import 'package:newapp/Screen/Homescreen.dart';
import 'package:newapp/Screen/Login.dart';
import 'package:newapp/Screen/Registration.dart';

class Login extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<Login> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  String _email;
  String _password;

  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();

      // Email & password matched our validation rules
      // and are saved to _email and _password fields.
      _performLogin();
    }
  }

  void _performLogin() {
    // This is just a demo, so no actual login here.
    final snackbar = SnackBar(
      content: Text('Email: $_email, password: $_password'),
    );

    scaffoldKey.currentState.showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: scaffoldKey,
      appBar: PreferredSize(
                            preferredSize: Size.fromHeight(260.0),
                            child: AppBar(
                              flexibleSpace: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  //
                                  Image.network(
                                    'https://pbs.twimg.com/profile_images/621964282696232960/IdhRyQIB.png',
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
        //title: Text('Validating forms'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Email',
                icon: Icon(Icons.email, color: Colors.blue),),
                validator: (val) =>
                    !val.contains('@') ? 'Not a valid email.' : null,
                onSaved: (val) => _email = val,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password',icon: Icon(Icons.lock_outline, color: Colors.blue),),
                validator: (val) =>
                    val.length < 6 ? 'Password too short.' : null,
                onSaved: (val) => _password = val,
                obscureText: true,
              ),
              RaisedButton(
                color: Colors.blue,
                onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Homescreen()));  
                                },
                child: new Text('Login',style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
              ),
            
      Padding(
                  padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 10.0, bottom: 15.0),
                          //child: Center(
                          child: Text(
                            "Forgot Password?",
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                                //decoration: TextDecoration.underline,
                                // color: Colors.black,
                                fontSize: 13.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ]
                  ),
      ),
                   Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 30, bottom: 15.0),
                          child: Text('New User?',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  )),
                        ),

                      Container(
                          width: 200,
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.blue,
                          ),
                          child: FlatButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Registration()));
                            },
                            child: Text(
                              'Register Here',
                              style: TextStyle(color: Colors.white,fontSize: 20 ,fontWeight: FontWeight.bold)),
                            ),
                          ),
                      ]
                        ),
                        
                      
                      ]
                   ),
                  
      
            
          ),
        ),
      
    );
  }
}

