import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:point_in_polygon/point_in_polygon.dart';
import 'package:provider/provider.dart';

import '../models/vehicleModel.dart';


class Vehicle_List extends StatefulWidget {

  @override
  State<Vehicle_List> createState() => _Vehicle_ListState();
}

class _Vehicle_ListState extends State<Vehicle_List> {


  @override
  Widget build(BuildContext context) {
    bool inFence = true;
    final vehicles = Provider.of<List<VehicleModel>?>(context);
    // print("Vehicle List");
    if ( vehicles == null || vehicles.isEmpty){

      return Card(child:Text("No Vehicle to Display",style: TextStyle(color: Colors.red),));

    }
  else{


    return ListView.builder(itemBuilder: (context,index){
      return Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 2.5, 10, 5),
          child: Card(
            elevation: 10,
            color:check(vehicles[index].poly, vehicles[index].position)? Colors.lightBlue[200]:Colors.red,

            child: ListTile(

              onTap: (){
                Navigator.pushNamed(context, '/display',arguments: {
                  'location' : vehicles[index].position,
                  'polygon': vehicles[index].poly,
                  'name':vehicles[index].name

                });
              },
              title: Text("The vehicle plate number is ${vehicles[index].plateNumber}"),
            ),

          ),
        ),
      );
    },itemCount: vehicles.length,);

  }}
  bool check(List<dynamic>? x,GeoPoint p){
    if (x == null){
      return true;
    }
    List<Point> point = [];
    x.forEach((element) {
      point.add(Point(x: element.latitude,y: element.longitude));
    });
    return Poly.isPointInPolygon(Point(x: p.latitude, y: p.longitude), point);

  }
}


