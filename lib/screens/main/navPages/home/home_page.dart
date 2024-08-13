
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodprime/theme/style.dart';

import 'home_category/grocery_and_fruit/grocery_and_fruit_main_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Column(
          children: [
            _homeCategoryItemWidget(context,
                title: "Grocery & Fruts",
                description: "Order fresh vegetables & fruits anytime, anywhere",
                image: "assets/home_image_1.png",
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const GroceryAndFruitMainPage()));
                }),
                
          ],
        ),
      ),
    );
  }
  _homeCategoryItemWidget(BuildContext context, {required String title, required String description, required String image, VoidCallback ? onTap }){
     return GestureDetector(
       onTap: onTap,
       child: Container(
        padding:  EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.20,
        decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0,1),
                  spreadRadius: 1.5,
                  blurRadius: 5.5,
                  color: Colors.grey[350]!
              )
            ]
        ),
        child: Container(
          padding:  EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                    const SizedBox(height: 10,),
                    Text(description, style: TextStyle(fontSize: 15, color: Colors.grey[700]),),
                  ],
                ),
              ),
              Image.asset(image,fit: BoxFit.contain,)
            ],
          ),
        ),
           ),
     );
  }
}
