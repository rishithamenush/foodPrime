import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import '../../theme/style.dart';
import '../../widgets/button_container_widget.dart';
import '../../widgets/form_container_widget.dart';

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
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Select Payment Method",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildPaymentOption('assets/master_card.png'),
                _buildPaymentOption('assets/visa.png'),
                _buildPaymentOption('assets/paypal.png'),
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              "Card Number",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const FormContainerWidget(hintText: "Enter Your Card Number"),
            const SizedBox(height: 20),
            const Text(
              "Expiration date",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const FormContainerWidget(hintText: "MM/YY/DD"),
            const SizedBox(height: 20),
            const Text(
              "Security Code",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const FormContainerWidget(hintText: "Enter Your Security Code"),
            const SizedBox(height: 40),
            ButtonContainerWidget(
              title: "Order Now",
              onTap: () {
                _showSuccessPopup(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentOption(String imagePath) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 0.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Image.asset(
        imagePath,
        height: 60,
        width: 80,
      ),
    );
  }

  void _showSuccessPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 10),
              Image(
                image: AssetImage('assets/order_successful.png'),
                height: 80,
                width: 80,
              ),
              SizedBox(height: 20),
              Text("Order Has been Successful",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26),
              textAlign: TextAlign.center,),
            ],
          ),
          content: const Text("You can track the delivery in the 'Orders' section.",style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,),

          actions: <Widget>[
            // TextButton(
            //   child: const Text("OK"),
            //   onPressed: () {
            //     Navigator.of(context).pop();
            //     // Navigate to another screen or perform other actions if needed
            //   },
            // ),
            ButtonContainerWidget(
              title: "Continue Shopping",
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            const SizedBox(height: 10),
          ],
        );
      },
    );
  }
}