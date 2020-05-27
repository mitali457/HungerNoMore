

// class User {

//   String _id;
//   String _name;
//   String _email;
//   //String _mobile;

//   User(this._id,this._name, this._email, {String uid},  );

//   String get name => _name;

//   String get email => _email;



//   //String get mobile => _mobile;

//   String get id => _id;

//   User.fromSnapshot(DataSnapshot snapshot) {
//     _id = snapshot.key;
//     _name = snapshot.value['name'];
//     _email = snapshot.value['email'];
//      //_mobile = snapshot.value['mobile'];
//   }

// }


class User {
  String uid;
   String email;
   String name;
   String photoUrl;
  

   User(data, {this.uid, this.email,this.name, this.photoUrl});

    Map toMap(User user) {
    var data = Map<String, dynamic>();
    data['uid'] = user.uid;
    data['email'] = user.email;
     data['name'] = user.name;
    data['photoUrl'] = user.photoUrl;
    
    return data;
  }

  User.fromMap(Map<String, dynamic> mapData) {
    this.uid = mapData['uid'];
    this.email = mapData['email'];
    this.name = mapData['name'];
    this.photoUrl = mapData['photoUrl'];
     
  }
}

// class User {
//   final String email;
//   final String id;
//   final String photoUrl;
//   final String username;

  
//   const User(
//       {this.username,
//       this.id,
//       this.photoUrl,
//       this.email,
      
//       });

//   factory User.fromDocument(DocumentSnapshot document) {
//     return User(
//       email: document['email'],
//       username: document['username'],
//       photoUrl: document['photoUrl'],
//       id: document.documentID,
     
      
//     );
//   }
// }
