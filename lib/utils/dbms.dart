import 'package:topupev/constants.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:geoflutterfire/geoflutterfire.dart';

// firestore init
FirebaseFirestore firestore = FirebaseFirestore.instance;
// Geoflutterfire geo;
// Stream<List<DocumentSnapshot>> stream;

// Future addPoint({@required AmbulanceData ambulanceData}) async {
//   // GeoFirePoint geoFirePoint = geo.point(latitude: lat, longitude: lng);
//   await firestore
//       .collection('ambulances').doc(ambulanceData.vehicleNumber).set({
//     'vehicleNumber': ambulanceData.vehicleNumber,
//     'isOnline': ambulanceData.isOnline,
//     'operatorName': ambulanceData.operatorName,
//     'operatorEmail': ambulanceData.operatorEmail,
//     'operatorNumber': ambulanceData.operatorNumber,
//     'operatorType': ambulanceData.operatorType,
//     'city': ambulanceData.city,
//     'position': ambulanceData.position.data,
//
//   }).then((_) {
//     print('added ${ambulanceData.position.hash} successfully');
//   });
// }


Future<StationData> fetchAmbulanceDetails({required String code}) async {
  StationData stationData = StationData(
    title: 'Tata Charging Station',
    subtitle: 'Available',
    code: 'ABC123',
    address: 'Dehu Phata, Alandi',
    lat: 0,
    lag: 0,
    chargerType: 'IS-17017-Part-23',
    rate: 50,
    imgUrl:
    'https://raw.githubusercontent.com/AdityaBirangal/TopUpEV/master/images/TopUpEV_Logo_Horizontal.png',
  );

  await firestore.collection('stations').doc(code).get().then((value) {
    print('dbms : stationData : Data : ${value.data()}');
    // final GeoPoint point = value.data()['position']['geopoint'];
    // GeoFirePoint geoFirePoint = GeoFirePoint(point.latitude, point.longitude);
    stationData = StationData(
        title: value.data()!['title'] ?? 'title',
        subtitle: value.data()!['title'] ?? 'title',
        code: value.data()!['title'] ?? 'title',
        address: value.data()!['title'] ?? 'title',
        lat: value.data()!['title'] ?? 'title',
        lag: value.data()!['title'] ?? 'title',
        chargerType: value.data()!['title'] ?? 'title',
        imgUrl: value.data()!['title'] ?? 'title',
        rate: value.data()!['title'] ?? 'title');
    return stationData;

  });

  return stationData;
}

// Future<AmbulanceData> fetchMyAmbulanceDetails({@required String operatorEmail})async{
//   AmbulanceData ambulanceData;
//
//   await firestore.collection('ambulances').where('operatorEmail', isEqualTo: operatorEmail).get().then((QuerySnapshot querySnapshot) {
//     querySnapshot.docs.forEach((value) {
//       print('dbms : fetchAmbulanceDetails : Data : ${value.data()}');
//       final GeoPoint point = value.data()['position']['geopoint'];
//       GeoFirePoint geoFirePoint = GeoFirePoint(point.latitude, point.longitude);
//
//       ambulanceData = AmbulanceData(
//         vehicleNumber: value.data()['vehicleNumber'] ?? 'vehicleNumber',
//         isOnline: value.data()['isOnline'] ?? false,
//         operatorName: value.data()['operatorName'] ?? 'operatorName',
//         operatorEmail: value.data()['operatorEmail'] ?? 'operatorEmail',
//         operatorNumber: value.data()['operatorNumber'] ?? 'operatorNumber',
//         operatorType: value.data()['operatorType'] ?? 'operatorType',
//         city: value.data()['city'] ?? 'city',
//         photoURL: value.data()['photoURL'] ?? 'https://firebasestorage.googleapis.com/v0/b/ambookapp.appspot.com/o/AmbulancePhotos%2FAmBook.png?alt=media&token=5b74baa5-5d7c-4bfe-bee7-a14733970d69',
//         position: geoFirePoint,
//       );
//       print('dbms : fetchAmbulanceDetails : end : ${ambulanceData.operatorName}');
//
//     });
//   });
//   return ambulanceData;
//
// }


// Future updatePoint({@required AmbulanceData ambulanceData}) async {
//   print('updatePoint');
//   await firestore
//       .collection('ambulances').doc(ambulanceData.vehicleNumber).set({
//     'position': ambulanceData.position.data,
//   },
//       SetOptions(merge: true)
//
//   ).then((_) {
//     print('added ${ambulanceData.position.hash} successfully');
//   });
// }