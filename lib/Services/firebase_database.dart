


import 'package:firebase_database/firebase_database.dart';

import 'package:newapp/Model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseServise {
  List<User> user_ref = [];
  SharedPreferences sharedPreferences;
    
  final String uid;
   User user;
  DatabaseServise({this.uid});
  //final CollectionReference userCollection = Firestore.instance.collection('user');
  final databaseReference = FirebaseDatabase.instance.reference().child('user');

  set name(String name) {}

  set email(String email) {}
  Future updateUsersetdata(
    String name,
    String email,
    //String password
  ) async {
    return await databaseReference.child(uid).set({
      'name': name,
      'email': email,
      'image': '',
     
    });
  }
  

  Future updateUsergetdata() async {
    try{
      print(uid);
    DataSnapshot userData = await databaseReference.once().then((DataSnapshot snapshot)
    {
      //Map<dynamic, dynamic> values=snapshot.value;
      //print(values["name"]);
      print('Data : ${snapshot.value}');
      print('object');
      //return;
      var keys = snapshot.value.keys;
      var data = snapshot.value;
     
    user_ref.clear();
      for (String individualkey in keys) {
       
        // User databaseReference =User
        // (data[individualkey]['image'],data[individualkey]['name'], data[individualkey]['email']);
        //user_ref.add(databaseReference);
         print('length:$databaseReference');
      }
      
    
      
    });}
    catch (e) {
       print(e);

    }
    
    }
  onChanged(value) async {
     sharedPreferences = await SharedPreferences.getInstance();
     sharedPreferences.setString("Email", value.email);
      print(value.email);
       sharedPreferences.setString("name", value.name);
      print(value.name);
      setData();
     }
     setData() async {
     sharedPreferences = await SharedPreferences.getInstance();
    email= sharedPreferences.getString("Email");
    name = sharedPreferences.getString("name");
  }
// Future<void> addDataToDb(FirebaseUser currentUser) async {
//     print("Inside addDataToDb Method");

//     _firestore
//         .collection("display_names")
//         .document(currentUser.name)
//         .setData({'displayName': currentUser.name});

//     user = User(
//         uid: currentUser.uid,
//         email: currentUser.email,
//         name:currentUser.name,
//         photoUrl: currentUser.photoUrl,
//         );

   

//     return _firestore
//         .collection("users")
//         .document(currentUser.uid)
//         .setData(user.toMap(user));
//   }

  // Future<bool> authenticateUser(FirebaseUser user) async {
  //   print("Inside authenticateUser");
  //   final QuerySnapshot result = await _firestore
  //       .collection("users")
  //       .where("email", isEqualTo: user.email)
  //       .getDocuments();

  //   final List<DocumentSnapshot> docs = result.documents;

  //   if (docs.length == 0) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }
  //   Future<FirebaseUser> getCurrentUser() async {
  //   FirebaseUser currentUser;
  //   currentUser = await _auth.currentUser();
  //   print("EMAIL ID : ${currentUser.email}");
  //   return currentUser;
  // }

  // Future<String> uploadImageToStorage(File imageFile) async {
  //   _storageReference = FirebaseStorage.instance
  //       .ref()
  //       .child('${DateTime.now().millisecondsSinceEpoch}');
  //   StorageUploadTask storageUploadTask = _storageReference.putFile(imageFile);
  //   var url = await (await storageUploadTask.onComplete).ref.getDownloadURL();
  //   return url;
  // }
    
  // Future<void> updatePhoto(String photoUrl, String uid) async {
  //   Map<String, dynamic> map = Map();
  //   map['photoUrl'] = photoUrl;
  //   return _firestore.collection("users").document(uid).updateData(map);
  // }

  // Future<void> updateDetails(
  //     String uid, String name, String email,String photoUrl) async {
  //   Map<String, dynamic> map = Map();
   
  //   map['email'] = email;
  //   map['name'] = name;
  //   map['photoUrl']=photoUrl;
  //   return _firestore.collection("users").document(uid).updateData(map);
  // }
   
  
   }





