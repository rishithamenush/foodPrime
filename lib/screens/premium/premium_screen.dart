import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodprime/screens/main/main_screen.dart';
import 'package:foodprime/theme/style.dart';
import 'package:foodprime/widgets/button_container_widget.dart';

class PremiumScreen extends StatefulWidget {
  const PremiumScreen({super.key});

  @override
  State<PremiumScreen> createState() => _PremiumScreenState();
}

class _PremiumScreenState extends State<PremiumScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                width: 150,
                height: 50,
                child: Image.asset(
                  "assets/word_app_logo.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text("The best of your \nneighborurhood,\ndelivered for less.",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
            const SizedBox(
              height: 30,
            ),
            _singlePremiumItemWIdget(title: "Save an average of \$4 to 5 per order.", icon: Icon(Icons.food_bank, color: primaryColorED6E1B,size: 30,)),
            const SizedBox(height: 20,),
            _singlePremiumItemWIdget(title: "Look for FoodPrime logo to find \n1k eligible resturants.", icon: Icon(Icons.restaurant, color: primaryColorED6E1B,size: 30,)),
            const SizedBox(height: 20,),
            _singlePremiumItemWIdget(title: "Enjoy zero delivery fees and reduced \nservice fees on order.", icon: Icon(Icons.shopping_cart, color: primaryColorED6E1B,size: 30,)),
            const SizedBox(height: 20,),
            _singlePremiumItemWIdget(title: "Free 1 month trial, \$9.99 month \nafter, easily cancel anthing.", icon: Icon(Icons.calendar_today, color: primaryColorED6E1B,size: 30,)),
            const SizedBox(height: 40,),
            Container(
              width: double.infinity,
              height: 1,
                color: Colors.grey,
            ),
            const SizedBox(height: 30),
            const ButtonContainerWidget(title: "Try FoodPrime free for 1 month"),
            const SizedBox(height: 30),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => MainScreen()), (route) => false);
                },child: const Text("Skip", style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),),
              ),
            ),
            const SizedBox(height: 30),
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                text: "By tapping the button, I agree to the ",style: TextStyle(color: Colors.black),
                children: [
                  TextSpan(
                    text: " Teams ", style: TextStyle(color: primaryColorED6E1B),
                  ),
                  TextSpan(
                      text: "and an automatic morthly charge"
                  ),
                  TextSpan(
                      text: " cancel ", style: TextStyle(color: primaryColorED6E1B),
                  ),
                  TextSpan(
                      text: "Cancel in account prior to any renewal to avoid charges."
                  ),
                ]
              ),

            ),
          ],
        ),
      ),
    );
  }
  _singlePremiumItemWIdget({Widget? icon, String? title}){
    return Row(
      children: [
        icon!,
        const SizedBox(
          width: 10,
        ),
        Text("$title", style: TextStyle(fontSize: 17) ,),
      ],
    );
  }
}
