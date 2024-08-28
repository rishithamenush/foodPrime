import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodprime/theme/style.dart';
import 'package:foodprime/widgets/button_container_widget.dart';

class FoodDetailPage extends StatefulWidget {
  final Map<String, String> data;
  const FoodDetailPage({super.key, required this.data});

  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  int _quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomWidget(),
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
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
              ),
              child: Image.asset("assets/${widget.data['image']}", fit: BoxFit.fill,),
            ),
            const SizedBox(height: 15,),
            _selectQuentityWidget(),
            const SizedBox(height: 15,)
          ],
        ),
      ),
    );
  }
  _selectQuentityWidget(){
    return Center(
      child: Container(
        width: 130,
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: lightGreyColor,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 3),
              spreadRadius: 1.5,
              blurRadius: 5.5,
              color: Colors.grey[400]!
            )
          ]
        ),
        child: Row(
          children: [
            GestureDetector(onTap: _decrementQuantity, child: Icon(Icons.remove_outlined),),
            const SizedBox(width: 10,),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: primaryColorED6E1B,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(child: Text("$_quantity",style: TextStyle(fontSize: 15, color: Colors.white),),),
            ),
            const SizedBox(width: 20,),
            GestureDetector(onTap: _incrementQuantity, child: Icon(Icons.add,)),
          ],
        ),
      ),
    );
  }
  _incrementQuantity(){
    setState(() {
      _quantity++
    });
  }
  _bottomWidget(){
    return Container(
      height: 100,
      decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: const BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              offset: const Offset(5, -2),
              color: Colors.grey[300]!,
              spreadRadius: 1.5,
              blurRadius: 10,
            )
          ]
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Total\$123", style: TextStyle(fontSize: 12),),
            ButtonContainerWidget(
              width: 150,
              height: 40,
              title: "Add to cart",
              onTap: (){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Item added in cart")));
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
