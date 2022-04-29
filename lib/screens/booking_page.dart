import 'package:flutter/material.dart';
import 'package:topupev/constants.dart';
import 'package:topupev/screens/payment_page.dart';
import 'package:topupev/widgets/myLabelText.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Booking')),
      body: ListView(
        children: [
          Image.network(
            stationData.imgUrl,
            scale: 2,
          ),
          MyLabelText(label: 'Name', title: stationData.title),
          MyLabelText(label: 'Status', title: stationData.subtitle),
          MyLabelText(label: 'Code', title: stationData.code),
          MyLabelText(label: 'Address', title: stationData.address),
          MyLabelText(label: 'Charger Type', title: stationData.chargerType),
          MyLabelText(label: 'Rate', title: 'Rs. ${stationData.rate}'),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 8,horizontal: 32),
            child: RaisedButton(
              color: Colors.cyan,
              // padding: EdgeInsets.symmetric(vertical: 8,horizontal: 32),
                child: const Text('Book Now'),
                onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const PaymentPage()));
                }),
          ),
        ],
      ),
    );
  }
}
