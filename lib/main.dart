import 'package:flutter/material.dart';
import 'package:foodprime/screens/main/main_screen.dart';
import 'package:foodprime/screens/onboarding/onboarding_screen.dart';
import 'package:foodprime/screens/splash/splash_screen.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const primarySwatch = MaterialColor(
        0xFFED6E1B,
      <int, Color>{
        50: Color(0xFFFFE0B2),
        100: Color(0xFFFFCC80),
        200: Color(0xFFFFB74D),
        300: Color(0xFFFFA726),
        400: Color(0xFFFF9800),
        500: Color(0xFFFB8C00),
        600: Color(0xFFF57C00),
        700: Color(0xFFEF6C00),
        800: Color(0xFFE65100),
        900: Color(0xFFED6E1B),
      }
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Food Prime",
      theme: ThemeData(
        primarySwatch: primarySwatch,
        scaffoldBackgroundColor: Color(0xFFFFFFFF),
      ),
      home: const SplashScreen(child: OnboardingScreen()),
    );
  }
}
