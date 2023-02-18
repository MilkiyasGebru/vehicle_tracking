// import 'dart:js';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vehicle_tracking/models/vehicleModel.dart';
import 'package:vehicle_tracking/services/database.dart';

import '../models/user.dart';
import '../services/auth.dart';
import '../services/vehicle_list.dart';
import 'package:point_in_polygon/point_in_polygon.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<ModifiedUser?>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Welcome to Home Page"),actions: [ElevatedButton.icon(label: Text("SignOut"),icon:Icon(Icons.person),onPressed: () async{

        _auth.signOut();

      },)],),
      body: StreamProvider<List<VehicleModel>?>.value(
          initialData: null, value: DataBaseService(uid:user?.uid).vehicles,
          child:Vehicle_List()



      ),
    );
  }
}


// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);
//
//   @override
//   State<Home> createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//   @override
//
//   Widget build(BuildContext context) {
//     print("Hellow orld ");
//     final AuthService _auth = AuthService();
//     return Scaffold(
//       appBar: AppBar(title: Text("Welcome to Home Page"),actions: [ElevatedButton.icon(label: Text("SignOut"),icon:Icon(Icons.person),onPressed: () async{
//
//       _auth.signOut();
//
//       },)],),
//       body: StreamProvider<List<VehicleModel>?>.value(
//         initialData: null, value: DataBaseService().vehicles,
//         child:Vehicle_List()
//
//
//
//       ),
//     );
//   }
// }
