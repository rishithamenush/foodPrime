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
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        child: Column(
          children: [
            Row(
              children: [
                 Image.asset("assets/user_profile.png"),
                const SizedBox(width: 10,),
                const Text("Rishitha Menusha", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
              ],
            ),
            const SizedBox(height: 10,),
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 40,),
            _settingsItem(
              title: "Language",
              prefixIcon: Icons.language,
            ),
            const SizedBox(height: 25,),
            _settingsItem(
              title: "Help",
              prefixIcon: Icons.help_outline_rounded,
            ),
            const SizedBox(height: 25,),
            _settingsItem(
              title: "Theme",
              prefixIcon: Icons.light_mode_sharp,
            ),
          ],
        ),
      ),
    );
  }
  _settingsItem( {String? title, IconData? prefixIcon}){
    return Container(
      width: double.infinity,
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: lightGreyColor,
          borderRadius: BorderRadius.circular(10)
      ),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(prefixIcon, size: 30,),
              const SizedBox(width: 20,),
              Text("$title", style: const TextStyle(fontSize: 18),)
            ],
          ),
          const Icon(Icons.arrow_forward_ios)
        ],
      ),
    );
  }
}
