import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodprime/screens/onboarding/onboarding_entity.dart';
import 'package:foodprime/theme/style.dart';

import '../../widgets/button_container_widget.dart';
import '../auth/login_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  List<OnBoardingEntity> onBoardingData = OnBoardingEntity.onBoardingData;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 130,
          ),
          Container(
            width: 150,
            height: 50,
            child: Image.asset(
              "assets/word_app_logo.png",
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(
            height: 130,
          ),
          Expanded(
            child: PageView.builder(
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemCount: onBoardingData.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Image.asset("assets/${onBoardingData[index].image}"),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      "${onBoardingData[index].title}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "${onBoardingData[index].description}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(onBoardingData.length, (index) => buildDot(index)),
          ),
          const SizedBox(
            height: 30,
          ),
          currentIndex == 2
              ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: ButtonContainerWidget(
              title: "Get Started",
              hasIcon: true,
              icon: Icons.arrow_forward_ios,
              onTap: () {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginPage()), (route) => false);
              },
            ),
          )
              : SizedBox(height: 38),
          const SizedBox(height: 48),
          // Maintain bottom padding
        ],
      ),
    );
  }

  Widget buildDot(int index) {
    return Container(
      width: 10,
      height: 10,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: currentIndex == index ? primaryColorED6E1B : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}
