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

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _animation = Tween(begin: 2.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _animationController.forward();

    Future.delayed(const Duration(milliseconds: 3000)).then((value) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => widget.child),
            (route) => false,
      );
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColorED6E1B,
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: Image.asset("assets/app_logo.png"),
        ),
      ),
    );
  }
}
