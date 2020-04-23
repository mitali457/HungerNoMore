import 'package:firebase_database/firebase_database.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseServise {
  
  SharedPreferences sharedPreferences;
  final String uid;
  DatabaseServise({this.uid});
  //final CollectionReference userCollection = Firestore.instance.collection('user');
  final databaseReference = FirebaseDatabase.instance.reference().child('user');
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
    print(uid);
    DataSnapshot userData = await databaseReference.once().then((DataSnapshot snapshot)
    {
      print('Data : ${snapshot.value}');
      return;
      
    });
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
    // value.email= sharedPreferences.getString("Email");
    // value.name = sharedPreferences.getString("name");
  }

    
  
    
  
   
  
  }





