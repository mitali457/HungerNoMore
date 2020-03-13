import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServise {
  final String uid;
  DatabaseServise({this.uid});
  final CollectionReference userCollection = Firestore.instance.collection('user');
  Future updateUserdata (
    
    String email,
    String password) async{
      return await userCollection.document(uid).setData({
       
       'email':email,
       'password':password,

      });
    }
  
}