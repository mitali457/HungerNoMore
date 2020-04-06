import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:newapp/Utils/colors.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserAccount extends StatefulWidget {
  @override
  _UserAccountState createState() => _UserAccountState();
}

class _UserAccountState extends State<UserAccount> {
  SharedPreferences sharedPreferences;
  String email;
  String name;
  StorageReference _firebaseStorageRef =
      FirebaseStorage.instance.ref().child('myimage.jpeg');
  File imageFile;

  bool uploadedFileURL = false;
  String downloadurl;

  Future getImagegallery() async {
    var imagegallery = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      imageFile = imagegallery;
      print('Image Path $imageFile');
    });
  }

  // Upload image to firebase storage
  Future uploadPic() async {
    try {
      StorageUploadTask uploadTask =
          _firebaseStorageRef.child(".jpeg").putFile(imageFile);

      var dowurl = await (await uploadTask.onComplete).ref.getDownloadURL();
      downloadurl = dowurl.toString();
      print(downloadurl);

      saveToDatabase(downloadurl);
    } 
    catch (error) {
      print(error);
    }

    return downloadurl;
    ;
  }

  void saveToDatabase(downloadurl) {
    DatabaseReference ref = FirebaseDatabase.instance.reference();

    var data = {"image": downloadurl};
    ref.child('imagepost').push().set(data);
  }

  @override
  void initState() {
    super.initState();
    _getNameEmail();
  }

  _getNameEmail() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      email = sharedPreferences.getString("username");
      name = sharedPreferences.getString("name");
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: greencolor,
          leading: IconButton(
              icon: Icon(FontAwesomeIcons.arrowLeft),
              onPressed: () {
                Navigator.pop(context);
              }),
          title: Text('User Profile'),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: CircleAvatar(
                          radius: 100,
                          backgroundColor: greencolor,
                          child: ClipOval(
                            child:  SizedBox(
                              width: 180.0,
                              height: 180.0,
                              child: (imageFile != null)
                                  ? Image.file(
                                      imageFile,
                                      fit: BoxFit.fill,
                                    )
                                  : Image.network(
                                      "https://www.searchpng.com/wp-content/uploads/2019/02/Deafult-Profile-Pitcher.png",
                                      fit: BoxFit.fill,
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ]),
                Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: IconButton(
                    icon: Icon(
                      FontAwesomeIcons.camera,
                      color: greencolor,
                      size: 22.0,
                    ),
                    onPressed: () {
                      getImagegallery();
                    },
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
              //   Padding(
              //     padding:EdgeInsets.only(left:40),
              //  child: Container(
                 
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       children: <Widget>[
              //         Text('Username:',
              //             style: TextStyle(
              //                 color: Colors.blueGrey, fontSize: 18.0,fontWeight: FontWeight.bold)),
              //         SizedBox(width: 20.0),
              //         Text('name $name',
              //             style: TextStyle(
              //                 color: Colors.black,
              //                 fontSize: 16.0,
              //                 fontWeight: FontWeight.bold)),
              //       ],
              //     ),
              //   ),
              //   ),
              //    Padding(
              //     padding:EdgeInsets.only(left:20),
              //  child:
              //   Container(
              //     margin: EdgeInsets.all(20.0),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       children: <Widget>[
              //         Text('Email:',
              //             style: TextStyle(
              //                 color: Colors.blueGrey, fontSize: 18.0,fontWeight: FontWeight.bold)),
              //         SizedBox(width: 20.0),
              //         Text(email,
              //             style: TextStyle(
              //                 color: Colors.black,
              //                 fontSize: 16.0,
              //                 fontWeight: FontWeight.bold)),
              //       ],
              //     ),
              //   ),
              //    ),
                 Container(
                   child: FlatButton(
                     color: greencolor,
                     onPressed: (){},
                    child: Text('Edit',style: TextStyle(
                                  color: Colors.white, fontSize: 16.0),)),
                 ),
                SizedBox(
                  height: 20.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    imageFile == null
                        ? Container()
                        : RaisedButton(
                            color: greencolor,
                            onPressed: () {
                              uploadPic();
                              
                            },
                            elevation: 4.0,
                            splashColor: Colors.blueGrey,
                            child: Text(
                              'Submit',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.0),
                            ),
                          ),
                  
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
