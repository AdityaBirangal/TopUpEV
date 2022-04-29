import 'package:flutter/material.dart';
import 'package:topupev/screens/map_page.dart';
import 'package:topupev/screens/profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';


class HomePage extends StatelessWidget {
  final User user;

  const HomePage({required this.user});

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
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage(user: user)));
          }, child: const Text('Profile Page')),

          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>MapPage()));
          }, child: const Text('Find Nearby Charging Stations')),

        ],
      ),),
    );
  }
}
