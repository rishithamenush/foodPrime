import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodprime/screens/main/main_screen.dart';
import 'package:foodprime/theme/style.dart';

class SplashScreen extends StatefulWidget {
  final Widget child;
  const SplashScreen({super.key, required this.child});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
     Future.delayed(const Duration(milliseconds: 3000)).then((value){
       Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => widget.child ), (route)=> false);
     });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColorED6E1B,
      body: Center(
        child: Image.asset("assets/app_logo.png"),
      ),
    );
  }
}
