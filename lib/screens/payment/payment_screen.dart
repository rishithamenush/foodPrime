import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../theme/style.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        centerTitle: true,
        title: const Text(
          "Payment",
          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 22 ), // Added text color to ensure visibility
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Select Payment Method",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),

      )
    );
  }
}