import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodprime/data/food_prime_data.dart';

import '../../../../../../theme/style.dart';
import '../../../../../search/search_page.dart';
import '../../../../../search/search_widget.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  int _currentSelectedCategory = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: whiteColor,
        centerTitle: true,
        leading: Transform.translate(
          offset: const Offset(0, -5),
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        title: Image.asset(
          "assets/word_app_logo.png",
          fit: BoxFit.contain,
          width: 150,
          height: 50,
        ),
      ),

    body: Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: SearchWidget(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage() ));
                    }
                ),
              ),
              const SizedBox(width: 10,),
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: primaryColorED6E1B,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(
                    Icons.settings_voice,
                    color: whiteColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const Text("Categories", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _singleCategoryItemWidget(
                  title: "Fruits",
                  color: _currentSelectedCategory == 0
                      ? primaryColorED6E1B
                      : Colors.grey[400] ?? Colors.grey,
                  onTap: (){
                    setState((){
                      _currentSelectedCategory = 0;
                    });
                  }
              ),
              _singleCategoryItemWidget(
                  title: "Vegitables",
                  color: _currentSelectedCategory == 1
                      ? primaryColorED6E1B
                      : Colors.grey[400] ?? Colors.grey,
                  onTap: (){
                    setState((){
                      _currentSelectedCategory = 1;
                    });
                  }
              ),
              _singleCategoryItemWidget(
                  title: "Kitchen",
                  color: _currentSelectedCategory == 2
                      ? primaryColorED6E1B
                      : Colors.grey[400] ?? Colors.grey,
                  onTap: (){
                    setState((){
                      _currentSelectedCategory = 2;
                    });
                  }
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const Text("Today Special Offer", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          const SizedBox(
            height: 20,
          ),
          _switchSpecialCategoryOnSelectedIndex(_currentSelectedCategory),

          const Text("Today Popular Now", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          const SizedBox(
            height: 20,
          ),
          _switchPopularCategoryOnSelectedIndex(_currentSelectedCategory),

        ],
      ),
    ),
    );
  }
  _singleCategoryItemWidget({required VoidCallback onTap, required Color color, required String title}){
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          width: 110,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: color,
          ),
          child: Center(
            child: Text(
              "$title",
              style: const TextStyle(color: whiteColor),
            ),
          ),
        ),
      ),
    );
  }

  //Switch Special List
  _switchSpecialCategoryOnSelectedIndex(int index){
    switch(index){
      case 0:
        {
          return _buildSpecialBurgerList();
        }
      case 1:
        {
          return _buildSpecialPizzaList();
        }
      case 2:
        {
          return _buildSpecialSandwichList();
        }
    }
  }

  _buildSpecialBurgerList(){
    return SizedBox(
      height: 250,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children:
          BURGER_SPECIAL_CATEGORY_LIST.map((specialBurger){
            return SizedBox(
              width: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Image.asset("assets/${specialBurger['image']}",fit: BoxFit.cover,),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${specialBurger['title']},", style: const TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 2,),
                          Text("\$5 Delivery Fee 20 -40 min")
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 20),
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.grey[350],
                          shape: BoxShape.circle
                        ),
                        child: Center(child: Text("${specialBurger['rating']}"),),
                      )
                    ],
                  )
                ],
              ),
            );
          }).toList(),
      ),
    );
  }

  _buildSpecialPizzaList(){
    return SizedBox(
      height: 250,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children:
        PIZZA_SPECIAL_CATEGORY_LIST.map((specialPizza){
          return SizedBox(
            width: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Image.asset("assets/${specialPizza['image']}",fit: BoxFit.cover,),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${specialPizza['title']},", style: const TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 2,),
                        Text("\$5 Delivery Fee 20 -40 min")
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Colors.grey[350],
                          shape: BoxShape.circle
                      ),
                      child: Center(child: Text("${specialPizza['rating']}"),),
                    )
                  ],
                )
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  _buildSpecialSandwichList(){
    return SizedBox(
      height: 250,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children:
        SANDWICH_SPECIAL_CATEGORY_LIST.map((specialSandwich){
          return SizedBox(
            width: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Image.asset("assets/${specialSandwich['image']}",fit: BoxFit.cover,),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${specialSandwich['title']},", style: const TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 2,),
                        Text("\$5 Delivery Fee 20 -40 min")
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Colors.grey[350],
                          shape: BoxShape.circle
                      ),
                      child: Center(child: Text("${specialSandwich['rating']}"),),
                    )
                  ],
                )
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  //Switch Popular List
  _switchPopularCategoryOnSelectedIndex(int index){
    switch(index){
      case 0:
        {
          return _buildPopularBurgerList();
        }
      case 1:
        {
          return _buildPopularPizzaList();
        }
      case 2:
        {
          return _buildPopularSandwichList();
        }
    }
  }
}
