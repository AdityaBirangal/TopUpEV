import 'package:flutter/material.dart';
import 'package:topupev/widgets/myLabelText.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Booking')),
      body: ListView(
        children: [
          Image.network('https://raw.githubusercontent.com/AdityaBirangal/TopUpEV/master/images/TopUpEV_Logo_Horizontal.png',scale: 2,),
          MyLabelText(label: 'label', title: 'title'),
          MyLabelText(label: 'label', title: 'title'),
          MyLabelText(label: 'label', title: 'title'),
          MyLabelText(label: 'label', title: 'title'),
          MyLabelText(label: 'label', title: 'title'),


        ],
      ),
    );
  }
}