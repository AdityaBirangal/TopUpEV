import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'booking_page.dart';

class MapPage extends StatefulWidget {

  @override
  MapPageState createState() => MapPageState();
}

class MapPageState extends State<MapPage> {

  Completer<GoogleMapController> _controller = Completer();
  static const LatLng _center = const LatLng(18.6783, 73.8950);
  final Set<Marker> _markers = {};
  LatLng _lastMapPosition = _center;
  MapType _currentMapType = MapType.normal;

  static final CameraPosition _position1 = CameraPosition(
    bearing: 192.833,
    target: LatLng(18.6783, 73.8950),
    tilt: 59.440,
    zoom: 14.0,
  );

  Future<void> _goToPosition1() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_position1));
  }

  _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  _onAddMarkerButtonPressed() {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId(_lastMapPosition.toString()),
          position: _lastMapPosition,
          infoWindow: InfoWindow(
            title: 'This is a Title',
            snippet: 'This is a snippet',
            onTap: (){
              print('object');
            }
          ),
          icon: BitmapDescriptor.defaultMarker,
        ),
      );
    });
  }

  Widget button(Function() function, IconData icon) {
    return FloatingActionButton(
      onPressed: function,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      child: Icon(
        icon,
        size: 36.0,
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState

    Marker myMarker = Marker(
      markerId: MarkerId('ABC123'),
      position: const LatLng(18.6783, 73.8950),
      infoWindow: InfoWindow(
          title: 'Tata Charging Station',
          snippet: 'Available',
          onTap: (){
            print('object');
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const BookingPage()));
          }
      ),
      icon: BitmapDescriptor.defaultMarker,
    );

    Marker myMarker2 = Marker(
      markerId: MarkerId('XYZ321'),
      position: const LatLng(18.6773, 73.8950),
      infoWindow: InfoWindow(
          title: 'Adi Charging Station',
          snippet: 'Available',
          onTap: (){
            print('object');
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const BookingPage()));
          }
      ),
      icon: BitmapDescriptor.defaultMarker,
    );

    Marker myMarker3 = Marker(
      markerId: MarkerId('MMM111'),
      position: const LatLng(18.6773, 73.8960),
      infoWindow: InfoWindow(
          title: 'Mayur Charging Station',
          snippet: 'Available',
          onTap: (){
            print('object');
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const BookingPage()));
          }
      ),
      icon: BitmapDescriptor.defaultMarker,
    );

    Marker myMarker4 = Marker(
      markerId: MarkerId('EEE111'),
      position: const LatLng(18.6793, 73.8950),
      infoWindow: InfoWindow(
          title: 'Eva Charging Station',
          snippet: 'Available',
          onTap: (){
            print('object');
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const BookingPage()));
          }
      ),
      icon: BitmapDescriptor.defaultMarker,
    );

    _markers.add(myMarker);
    _markers.add(myMarker2);
    _markers.add(myMarker3);
    _markers.add(myMarker4);


    setState(() {

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("TopUpEV Map"),
        ),
        body: Stack(
          children: <Widget>[
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: const CameraPosition(
                target: _center,
                zoom: 14.0,
              ),
              mapType: _currentMapType,
              markers: _markers,
              onCameraMove: _onCameraMove,
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.topRight,
                child: Column(
                  children: <Widget>[
                    button(_onMapTypeButtonPressed, Icons.map),
                    SizedBox(
                      height: 16.0,
                    ),
                    button(_onAddMarkerButtonPressed, Icons.add_location),
                    SizedBox(
                      height: 16.0,
                    ),
                    button(_goToPosition1, Icons.location_searching),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
  }
}