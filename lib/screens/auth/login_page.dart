
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodprime/theme/style.dart';
import 'package:foodprime/widgets/button_container_widget.dart';

import '../../widgets/form_container_widget.dart';
import '../premium/premium_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool _rememberMeCheckValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 140,),
            const Text("Log In", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            const SizedBox(height: 40,),
            const FormContainerWidget(hintText:"Email or UserName"),
            const SizedBox(height: 20,),
            const FormContainerWidget(hintText: "Password"),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      onChanged: (value){
                        setState(() {
                          _rememberMeCheckValue = value!;
                        });
                      },
                      value: _rememberMeCheckValue,
                    ),
                    const Text("Remember me",style: TextStyle(fontSize: 15),),
                  ],
                ),
                const Text("Forgot Password", style: TextStyle(color: primaryColorED6E1B, fontSize: 15),)
              ],
            ),
            const SizedBox(height: 20,),
            ButtonContainerWidget(title: "Log In", onTap: (){
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => PremiumScreen()), (route) => false);
            },)
          ],
        ),
      ),
    );
  }
}
