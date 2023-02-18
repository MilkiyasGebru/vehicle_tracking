
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geopoint/geopoint.dart';


class VehicleModel{

  late String name;
  late GeoPoint position;
  late String plateNumber;
  late String tracker;
  late String ownerID;
  // late GeoPoint pos;
  late List<dynamic>? poly;

  VehicleModel({required this.plateNumber,required this.position,required this.tracker,required this.ownerID,required this.poly, required this.name});

}


// GeoPoint x = GeoPoint(10,11) ;
// x.LatLng;
// x.LatLng();