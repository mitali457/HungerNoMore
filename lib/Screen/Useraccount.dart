import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:newapp/Model/imagepost.dart';
import 'package:newapp/Services/firebase_database.dart';
import 'package:newapp/Utils/colors.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:newapp/Widget/clippingclass.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserAccount extends StatefulWidget {
  @override
  _UserAccountState createState() => _UserAccountState();
}
class _UserAccountState extends State<UserAccount> {
  List<Imagepost> imagepostlist = [];
  TextEditingController _textFieldController = TextEditingController();
  DatabaseServise ds=DatabaseServise();
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
    
  }

  void saveToDatabase(downloadurl) {
    DatabaseReference ref = FirebaseDatabase.instance.reference();

    var data = {"image": downloadurl};
    ref.child('imagepost')
    .push().set(data);
  }

  @override
  void initState() {
    super.initState();
    _getNameEmail();
    //_userdetails() ;
    ds.updateUsergetdata();
    // DatabaseReference imagepostref =
    //     FirebaseDatabase.instance.reference().child("imagepost");
    //     imagepostref.once().then((DataSnapshot snap) {
    //  var keys = snap.value.keys;
    //   var data = snap.value;
    //   imagepostlist.clear();
    //   for (String individualkey in keys) {
    //     Imagepost imagepost = Imagepost(data[individualkey]['image']);
    //     imagepostlist.add(imagepost);
      

    //   }}); 
  }
// _userdetails() async{
//   DatabaseReference userdetails =
//         FirebaseDatabase.instance.reference().child('User');
//        await userdetails.child("rwcSku2TSFaaOBjXsobRtPa300L2").once().then((DataSnapshot snapshot) {
//            print('Data :${snapshot.value}');
//     //  var keys = snapshot.value.keys;
//       var data = snapshot.value;
     
//     // user_ref.clear();
//     //   for (String individualkey in keys) {
//     //     User userdata =User
//     //     (data[individualkey]['image'],data[individualkey]['name'], data[individualkey]['email']);
//     //     user_ref.add(userdata);
//     //   }
//       setState(() {
//         print('length:$user_ref.length');
//       });
//     });
// }
  _getNameEmail() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      email = sharedPreferences.getString("username");
      name = sharedPreferences.getString("name");
    });
  }
   void message() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
           title: Text('Add Your Details'),
            content: Container(
              child: TextField(
                controller: _textFieldController,
                decoration: InputDecoration(hintText: "Name"),
              ),
            ),
          
            actions: <Widget>[
              new FlatButton(
                child: new Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        }
          );
        

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: greencolor,
          elevation: 0,
          leading: IconButton(
              icon: Icon(FontAwesomeIcons.arrowLeft),
              onPressed: () {
                Navigator.pop(context);
              }),
          title: Text('User Profile'),
        ),
        body: ListView(  
        children: <Widget>[  
          Stack(  
            children: <Widget>[  
              Padding(  
                padding: const EdgeInsets.only(bottom: 30.0),  
                child: ClipPath(  
                  clipper: ClippingClass(),  
                  child: Container(  
                    height: 130.0,  
                    decoration: BoxDecoration(color: greencolor)  
                  ),  
                ),  
              ), 
               SizedBox(
                  height: 30.0,
                ),
              Positioned.fill(  
                child: Align(  
                  alignment: Alignment.bottomCenter,  
                  child:CircleAvatar(
                          radius: 60,
                          //backgroundColor: greencolor,
                          child: ClipOval(
                            child:  SizedBox(
                              width: 180.0,
                              height: 180.0,
                            child:Image.asset('assets/propic.jpg'),
                                     // "https://www.searchpng.com/wp-content/uploads/2019/02/Deafult-Profile-Pitcher.png",
                                      //fit: BoxFit.fill,
                                    
                            ),
                          ),
                        ), 
                    
                  ),  
                ), 
                 
               
            ],
              
          ), 
            Padding(
                  padding: EdgeInsets.only(left: 8,top:1),
                  child: IconButton(
                    icon: Icon(
                      FontAwesomeIcons.camera,
                      color: greencolor,
                      size: 29.0,
                    ),
                    onPressed: () {
                      getImagegallery();
                    },
                  ),
                ),
         
                SizedBox(
                  height: 20.0,
                ),
                Padding( padding:EdgeInsets.only(left:40),
               
                child: Container(
                  
              // child: userdetails.length == 0 ?
              // Text('')
              // :
              child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text('Username:',
                          style: TextStyle(
                              color: Colors.blueGrey, fontSize: 18.0,fontWeight: FontWeight.bold)),
                      SizedBox(width: 20.0),
                      Text('Mitali Mondal',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                ),
                 Padding(
                  padding:EdgeInsets.only(left:20),
               child:
                Container(
                  margin: EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text('Email:',
                          style: TextStyle(
                              color: Colors.blueGrey, fontSize: 18.0,fontWeight: FontWeight.bold)),
                      SizedBox(width: 20.0),
                      Text(email,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                 ),
                 SizedBox(
                  height: 20.0,
                ),
                 Container(
                   width: 30,
                   child: Padding(
                    padding: EdgeInsets.only(top: 5, left: 70, right: 70),
                     child: FlatButton(
                        shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                       color: greencolor,
                       onPressed: (){
                         message();
                       },
                      child: Text('Edit',style: TextStyle(
                                    color: Colors.white, fontSize: 16.0),)),
                   ),
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
                              uploadPic();           },
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
      

        
       
      );  
           
  }
  // Widget imagepostUI(String image) {
  //   return Container(
  //       height: 180,
  //       width: 180,
  //       child: CircleAvatar(
  //         child: Image.network(image, fit: BoxFit.fill),
  //       ));
  // }
}





// import 'dart:io';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:newapp/Services/firebase_database.dart';

// class EditProfileScreen extends StatefulWidget {
//   final String photoUrl, email,  name;

//   EditProfileScreen(
//       {this.photoUrl, this.email, this.name,});

//   @override
//   _EditProfileScreenState createState() => _EditProfileScreenState();
// }

// class _EditProfileScreenState extends State<EditProfileScreen> {
//   var _repository = DatabaseServise();
//   FirebaseUser currentUser;
//   final _nameController = TextEditingController();
//   final _photoUrlController=TextEditingController();
//   final _emailController = TextEditingController();
  

//   @override
//   void initState() {
//     super.initState();
//     _nameController.text = widget.name;
//     _photoUrlController.text=widget.photoUrl;
//     _emailController.text = widget.email;
    
//     _repository.getCurrentUser().then((user) {
//       setState(() {
//         currentUser = user;
//       });
//     });
//   }

//   File imageFile;

//   Future<File> _pickImage(String action) async {
//     File selectedImage;

//     action == 'Gallery'
//         ? selectedImage =
//             await ImagePicker.pickImage(source: ImageSource.gallery)
//         : await ImagePicker.pickImage(source: ImageSource.camera);

//     return selectedImage;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: new Color(0xfff8faf8),
//         elevation: 1,
//         title: Text('Edit Profile'),
//         leading: GestureDetector(
//           child: Icon(Icons.close, color: Colors.black),
//           onTap: () => Navigator.pop(context),
//         ),
//         actions: <Widget>[
//           GestureDetector(
//             child: Padding(
//               padding: const EdgeInsets.only(right: 12.0),
//               child: Icon(Icons.done, color: Colors.blue),
//             ),
//             onTap: () {
//               _repository
//                   .updateDetails(
//                       currentUser.uid,
//                       _nameController.text, 
//                       _photoUrlController.text,
//                       _emailController.text,
//                      )
//                   .then((v) {
//                 Navigator.pop(context);
//                 // Navigator.push(context, MaterialPageRoute(
//                 //   builder: ((context) => InstaHomeScreen())
//                 // ));
//               });
//             },
//           )
//         ],
//       ),
//       body: ListView(
//         children: <Widget>[
//           Column(
//             children: <Widget>[
//               GestureDetector(
//                   child: Padding(
//                     padding: const EdgeInsets.only(top: 12.0),
//                     child: Container(
//                         width: 110.0,
//                         height: 110.0,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(80.0),
//                           image: DecorationImage(
//                               image: widget.photoUrl.isEmpty
//                                   ? AssetImage('')
//                                   : NetworkImage(widget.photoUrl),
//                               fit: BoxFit.cover),
//                         )),
//                   ),
//                   onTap: _showImageDialog),
//               GestureDetector(
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 12.0),
//                   child: Text('Change Photo',
//                       style: TextStyle(
//                           color: Colors.blue[700],
//                           fontSize: 20.0,
//                           fontWeight: FontWeight.bold)),
//                 ),
//                 onTap: _showImageDialog,
//               )
//             ],
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 15.0),
//                 child: TextField(
//                   controller: _nameController,
//                   decoration: InputDecoration(
//                     hintText: 'Name',
//                     labelText: 'Name',
//                   ),
//                   onChanged: ((value) {
//                     setState(() {
//                       _nameController.text = value;
//                     });
//                   }),
//                 ),
//               ),
           
             
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
//                 child: TextField(
//                   controller: _emailController,
//                   decoration: InputDecoration(
//                       hintText: 'Email address', labelText: 'Email address'),
//                   onChanged: ((value) {
//                     setState(() {
//                       _emailController.text = value;
//                     });
//                   }),
//                 ),
//               ),
              
//             ],
//           )
//         ],
//       ),
//     );
//   }

//   _showImageDialog() {
//     return showDialog(
//         context: context,
//         barrierDismissible: false,
//         builder: ((context) {
//           return SimpleDialog(
//             children: <Widget>[
//               SimpleDialogOption(
//                 child: Text('Choose from Gallery'),
//                 onPressed: () {
//                   _pickImage('Gallery').then((selectedImage) {
//                     setState(() {
//                       imageFile = selectedImage;
//                     });
//                     //compressImage();
//                     _repository.uploadImageToStorage(imageFile).then((url) {
//                       _repository.updatePhoto(url, currentUser.uid).then((v) {
//                         Navigator.pop(context);
//                       });
//                     });
//                   });
//                 },
//               ),
//               SimpleDialogOption(
//                 child: Text('Take Photo'),
//                 onPressed: () {
//                   _pickImage('Camera').then((selectedImage) {
//                     setState(() {
//                       imageFile = selectedImage;
//                     });
//                     //compressImage();
//                     _repository.uploadImageToStorage(imageFile).then((url) {
//                       _repository.updatePhoto(url, currentUser.uid).then((v) {
//                         Navigator.pop(context);
//                       });
//                     });
//                   });
//                 },
//               ),
//               SimpleDialogOption(
//                 child: Text('Cancel'),
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//               )
//             ],
//           );
//         }));
//   }

  // void compressImage() async {
  //   print('starting compression');
  //   final tempDir = await getTemporaryDirectory();
  //   final path = tempDir.path;
  //   int rand = Random().nextInt(10000);

  //   Im.Image image = Im.decodeImage(imageFile.readAsBytesSync());
  //   Im.copyResize(image, 500);

  //   var newim2 = new File('$path/img_$rand.jpg')
  //     ..writeAsBytesSync(Im.encodeJpg(image, quality: 85));

  //   setState(() {
  //     imageFile = newim2;
  //   });
  //   print('done');
  // }
//}




