import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TopUpEV'),
        actions: [IconButton(
            icon: Icon(Icons.drive_eta), onPressed: (){
          // Navigator.push(context, MaterialPageRoute(builder: (context)=>OperatorLandingScreen()));
        })],),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Container(
              height: 200.0,
              child: Image.asset('images/TopUpEV_Logo.png'),
            ),
          ),
          ElevatedButton(onPressed: (){
            // Navigator.push(context, MaterialPageRoute(builder: (context)=>LocationScreen()));
          }, child: Text('Find Nearby Charging Stations')),
        ],
      ),),
    );
  }
}
