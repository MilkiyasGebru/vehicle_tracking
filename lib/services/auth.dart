import 'package:firebase_auth/firebase_auth.dart';
import 'package:vehicle_tracking/models/user.dart';
import 'package:vehicle_tracking/models/authUserModel.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<ModifiedUser?> get user{
    return _auth.userChanges().map(_userFromFireBase);

  }

  ModifiedUser? _userFromFireBase(User? user){
    // && user.emailVerified
    return (user != null && user.emailVerified ) ? ModifiedUser(uid: user.uid) : null;
  }

  Future registerWithEmailandPassword (String email, String password) async{

    try{

      UserCredential result =await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;

      if (user != null){
        await user.sendEmailVerification();
      }

      if (user != null && user.emailVerified == true){
        return authUser(user: user);}
        // return _userFromFireBase(user);
        return authUser(waitMessage: "Email has been Sent");
      }


    catch(e){

      // print(e.toString());
      return null;

        }

  }

  Future signWithEmailandPassword(String email,String password) async{
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password) as UserCredential;
      User? user = result.user;
      return _userFromFireBase(user);
    }
    catch(e){
      print(e.toString());
      return null;
    }


  }

  Future signOut() async{
    try{
      return await _auth.signOut();
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }



}