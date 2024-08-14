import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodprime/theme/style.dart';
import 'package:foodprime/widgets/button_container_widget.dart';

import '../../../payment/payment_screen.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // Map to track the quantity for each item
  final Map<String, int> _itemQuantities = {
    "Cheese Pizza": 1,
    "Browns Pizza": 1,
    "Masala Pizza": 1,
    "Golden Pizza": 1,
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        centerTitle: true,
        title: Image.asset(
          "assets/word_app_logo.png",
          fit: BoxFit.contain,
          width: 150,
          height: 50,
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "4 Items in the cart",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Column(
              children: [
                const SizedBox(height: 25,),
                _itemCardWidget(
                    title: "Cheese Pizza",
                    unitPrice: 23.9,
                    image: "pizza_popular_5.png"
                ),
                const SizedBox(height: 25,),
                _itemCardWidget(
                    title: "Browns Pizza",
                    unitPrice: 63.9,
                    image: "pizza_popular_2.png"
                ),
                // const SizedBox(height: 25,),
                // _itemCardWidget(
                //     title: "Masala Pizza",
                //     unitPrice: 33.2,
                //     image: "pizza_popular_1.png"
                // ),
                // const SizedBox(height: 25,),
                // _itemCardWidget(
                //     title: "Golden Pizza",
                //     unitPrice: 45.3,
                //     image: "pizza_popular_4.png"
                // ),
                // const SizedBox(height: 25,),
              ],
            ),
            const SizedBox(height: 60,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Items",  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold ),),
                Text("2", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)
              ],
            ),
            const SizedBox(height: 10,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Delivery Fee",  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold ),),
                Text("\$0.00", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)
              ],
            ),
            const SizedBox(height: 10,),
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey[350],
            ),
            const SizedBox(height: 10,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total",  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold ),),
                Text("\$112.00", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)
              ],
            ),
            const SizedBox(height: 30,),
            ButtonContainerWidget(title: "Checkout", onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (_) => PaymentScreen()));
            },),
            const SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }

  Widget _itemCardWidget({String? title, double? unitPrice, String? image}) {
    // Retrieve the quantity for this item from the map
    int quantity = _itemQuantities[title] ?? 1;
    double totalPrice = unitPrice! * quantity;

    return Container(
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            offset: const Offset(2, 2),
            spreadRadius: 2.5,
            blurRadius: 6.5,
            color: Colors.grey[300]!,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Row(
          children: [
            Image.asset("assets/$image", fit: BoxFit.contain,),
            const SizedBox(width: 10,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "$title",
                        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: lightGreyColor,
                        ),
                        child: const Center(
                          child: Icon(Icons.close, color: primaryColorED6E1B,),
                        ),
                      ),
                    ],
                  ),
                  const Text("Times Food"),
                  const SizedBox(height: 5,),
                  Text(
                    "\$${totalPrice.toStringAsFixed(2)}",
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (quantity > 1) {
                              _itemQuantities["$title"] = quantity - 1;
                            }
                          });
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 1),
                          ),
                          child: const Center(child: Icon(Icons.remove_outlined),),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Text("$quantity"),
                      const SizedBox(width: 10,),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _itemQuantities["$title"] = quantity + 1;
                          });
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 1),
                          ),
                          child: const Center(child: Icon(Icons.add),),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
