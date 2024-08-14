import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../theme/style.dart';
import '../../../../../search/search_page.dart';

class GroceryAndFruitMainPage extends StatefulWidget {
  const GroceryAndFruitMainPage({super.key});

  @override
  State<GroceryAndFruitMainPage> createState() => _GroceryAndFruitMainPageState();
}

class _GroceryAndFruitMainPageState extends State<GroceryAndFruitMainPage> {
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
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: SearchWidget(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage() ));
                  }
                ) )
          ],
        ),
      ),
    );
  }
}
