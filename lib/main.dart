// import 'dart:js';

// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:vehicle_tracking/models/user.dart';
import 'package:vehicle_tracking/pages/displayPage.dart';
import 'package:vehicle_tracking/pages/loginPage.dart';
import 'package:vehicle_tracking/pages/regiseterPage.dart';
import 'package:vehicle_tracking/pages/siginPage.dart';
import 'package:vehicle_tracking/services/auth.dart';
import 'package:vehicle_tracking/pages/welcomPage.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  print("I am iin Main");
  runApp(MaterialApp(

    home: StreamProvider<ModifiedUser?>.value(

      value: AuthService().user,
      initialData:null,

      child:LoginPage()
      // child:WelcomePage()


    ),
    routes: {
      // '/': (context)=> LoginPage(),
      '/signIn':(context) => SignInPage(),
      '/register':(context)=>RegisterPage(),
      '/display':(context)=>DisplayPage()
    },

  ));
}

