import 'package:firebase_auth/firebase_auth.dart';

class authUser{

  User? user;
  String? waitMessage;

  authUser({this.user,this.waitMessage});
}