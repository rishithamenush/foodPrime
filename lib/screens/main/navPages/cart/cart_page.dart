import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodprime/theme/style.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int quantity = 1;
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
          children: [
            const Text("2 Items in the list cart", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),

            const SizedBox(height: 25,),

            _itemCardWidget(
              title: "Cheese Pizza",
              price: "23.9",
              image: "pizza_popular_5.png"
            )

          ],
        ),
      ),
    );
  }

  _itemCardWidget({String? title, String? price, String? image}){
    return Container(
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                offset: const Offset(2,2),
                spreadRadius: 2.5,
                blurRadius: 6.5,
                color: Colors.grey[300]!
            )
          ]
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
                       Text("$title",  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: lightGreyColor
                        ),
                        child: const Center(child: Icon(Icons.close, color: primaryColorED6E1B,), ),
                      ),
                    ],
                  ),
                  const Text("Times Foold"),
                  const SizedBox(height: 5,),
                   Text("\$$price", style: const TextStyle(fontWeight: FontWeight.w600),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if(quantity > 1){
                              quantity -- ;
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
                          child:  Center(child: Icon(Icons.remove_outlined),),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Text("$quantity"),
                      const SizedBox(width: 10,),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                              quantity ++ ;
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
