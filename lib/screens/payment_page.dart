import 'package:flutter/material.dart';
import 'package:topupev/constants.dart';
import 'package:topupev/screens/login_page.dart';
import 'package:topupev/widgets/myLabelText.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Payment')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Payment Gateway Intergration'),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 8,horizontal: 32),
              child: RaisedButton(
                  color: Colors.cyan,
                  // padding: EdgeInsets.symmetric(vertical: 8,horizontal: 32),
                  child: const Text('Pay'),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SuccessPage()));

                  }),
            ),
          ],
        ),
      ),
    );
  }
}


class SuccessPage extends StatelessWidget {
  const SuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Success')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://icons.veryicon.com/png/o/miscellaneous/cloud-call-center/success-24.png',
              scale: 2,
            ),
            MyLabelText(label: 'Booking ID', title: 'ABC123-32142'),


            // Padding(
            //   padding: EdgeInsets.symmetric(vertical: 8,horizontal: 32),
            //   child: RaisedButton(
            //       color: Colors.cyan,
            //       // padding: EdgeInsets.symmetric(vertical: 8,horizontal: 32),
            //       child: const Text('Book Now'),
            //       onPressed: (){
            //         Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
            //       }),
            // ),
          ],
        ),
      ),
    );
  }
}

