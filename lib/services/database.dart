import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';


import '../models/vehicleModel.dart';

class DataBaseService{

  late final String? uid;
  DataBaseService( { this.uid});
  final CollectionReference vehicleCollection = FirebaseFirestore.instance.collection("vehicles");


  Stream<List<VehicleModel>?> get vehicles{

    return vehicleCollection.snapshots().map(_vehicleListFromSnapshot);

  }


  List<VehicleModel> _vehicleListFromSnapshot (QuerySnapshot snapshot){
    dynamic y = snapshot.docs;

    List<dynamic> z =[];
    y.forEach((doc){
      if (doc.data()["ownerID"] == uid){
        z.add(doc);
      }
    });
    List<VehicleModel> ans =[];
     z.forEach((x){
       ans.add(VehicleModel( position: x.data()["position"] ?? GeoPoint(48.8584,29.45 ), tracker: x.data()["tracker"]??"",plateNumber: x.data()["plateNumber"] ?? " ",ownerID: x["ownerID"]?? " ",poly:x.data()['pos'], name: x.id));
    });
     print("Finished");
    return ans;
    // });





  }


}