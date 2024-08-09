
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/form_container_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          children: [
            const SizedBox(height: 140,),
            Text("Log In", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
             const SizedBox(height: 140,),
            FormContainerWidget(hintText:"Email or UserName"),
            const SizedBox(height: 20,),
            FormContainerWidget(hintText: "Password"),
            const SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
