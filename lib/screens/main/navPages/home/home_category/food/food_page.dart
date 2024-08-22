import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../theme/style.dart';
import '../../../../../search/search_page.dart';
import '../../../../../search/search_widget.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
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
        ],
      ),
    ),
    );
  }
}
