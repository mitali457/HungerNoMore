

import 'package:firebase_auth/firebase_auth.dart';
 
import 'package:google_sign_in/google_sign_in.dart';
import 'package:newapp/Services/Userdatabase.dart';

class AuthProvider{
final GoogleSignIn _googleSignIn = GoogleSignIn();
final FirebaseAuth _auth = FirebaseAuth.instance;
 Future <bool> signInWithEmail(String email,String password) async
{
  try{
     print(_auth);

 AuthResult result=await _auth.signInWithEmailAndPassword(email: email, password: password);
 FirebaseUser user= result.user;
 
 print(user);
 if(user != null)
 return true;
 else
 return false;
}
catch (e) {
  print("result");

  print(e);

return false;
}

}
Future<bool>createUserWithNewEmail(String email,String password,String name)async
{
  try {
print(_auth);

 AuthResult result = await _auth.createUserWithEmailAndPassword(
   
      email:email,
      password: password,
      //name:name
    );
        FirebaseUser user= result.user;
 print(user);
 await DatabaseServise(uid: user.uid).updateUserdata( email, password);

  
  if(user != null)
 return true;
 else
 return false;
}
catch (e) {
  print("New user?? Please Register your New Account");

  print(e);

return false;
}
}
 Future<bool> logOut() async {
    // try {

      // print("m here");
    await  _auth.signOut();
//  return true;

//     } catch (e) {
//       print("error logging out $e");
//       return false;
//     }
 }
  Future<bool> loginWithGoogle() async {
    try {
      GoogleSignIn _googleSignIn = GoogleSignIn();
      GoogleSignInAccount account = await _googleSignIn.signIn();
      if(account == null )
        return false;
      AuthResult res = await _auth.signInWithCredential(GoogleAuthProvider.getCredential(
        idToken: (await account.authentication).idToken,
        accessToken: (await account.authentication).accessToken,
      ));
      if(res.user == null)
        return false;
      return true;
    }
    catch (e) {
      print("Error logging with google");
      return false;
    }
  }
  
  Future sendPasswordResetEmail(String email) async {
    
   return await  _auth.sendPasswordResetEmail(email: email);

    
  }
}


//   ShowToast(BuildContext context, String message) {
//     Scaffold.of(context).showSnackBar(new SnackBar(content: Text(message)));
//   }


//   HandleError(e) {
//     String errorType;

//     if (Platform.isAndroid) {
//       switch (e.message) {
//         case 'There is no user record corresponding to this identifier. The user may have been deleted.':
//           errorType = "User not found";
//           break;
//         case 'The password is invalid or the user does not have a password.':
//           errorType = "Invalid username passowrd";
//           break;
//         case 'The email address is already in use by another account.':
//           errorType = "User already register";
//           break;
//         case 'A network error (such as timeout, interrupted connection or unreachable host) has occurred.':
//           errorType = "Time our";
//           break;
//         // ...
//         default:
//           errorType = e.message;
//       }
//     } else if (Platform.isIOS) {
//       switch (e.code) {
//         case 'Error 17011':
//           errorType = "User not found";
//           break;
//         case 'Error 17009':
//           errorType = "Invalid username password";
//           break;
//         case 'Error 17020':
//           errorType = "Network error";
//           break;
//         // ...
//         default:
//           errorType = e.message;
//           print('Case ${e.message} is not jet implemented');
//       }
//     }
//     print("$errorType");
//     return errorType;
//   }
// }

