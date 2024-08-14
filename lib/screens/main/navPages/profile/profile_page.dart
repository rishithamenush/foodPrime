import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../theme/style.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
        actions: [
          Transform.translate(offset: const Offset(0, -5),
          child: IconButton(
            onPressed: (){},
            icon: const Icon(Icons.settings),
          ),
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Row(
              children: [
                 Image.asset("assets/user_profile.png"),
                const SizedBox(width: 10,),
                Text("Rishitha Menusha", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
              ],
            )
          ],
        ),
      ),
    );
  }
}
