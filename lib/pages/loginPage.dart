import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vehicle_tracking/pages/siginPage.dart';
import '../models/user.dart';
import 'home.dart';


class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<ModifiedUser?>(context);

    if ( user == null ){

        return SignInPage();

    }
    else{

      return Home();

    }

  }

}
