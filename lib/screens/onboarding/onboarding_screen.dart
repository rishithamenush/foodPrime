
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
  List<OnBoardingEntity> onBoadringData = OnBoardingEntity.onBoardingData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: onBoadringData.length,
          itemBuilder: (context, index){
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 100),
          child: Column(
            children: [
              Image.asset("assets/word_app_logo.png"),
              const SizedBox(
                height: 130,
              ),
              Image.asset("assets/${onBoadringData[index].image}"),
              const SizedBox(
                height: 40,
              ),
              Text(
               "${onBoadringData[index].title}",
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
                "${onBoadringData[index].description}",
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: index == 0 ? primaryColorED6E1B : Colors.grey,
                      shape: BoxShape.circle
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                        color: index == 1 ? primaryColorED6E1B : Colors.grey,
                        shape: BoxShape.circle
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                        color: index == 2 ? primaryColorED6E1B : Colors.grey,
                        shape: BoxShape.circle
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              index == 2
                ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: ButtonContainerWidget(
                    title: "Get Started",
                    hasIcon: true,
                    icon: Icons.arrow_forward_ios,
                    onTap: (){
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginPage()), (route) => false,);
                    }
                  ),
              ): Container(),
            ],
          ),
        );
      }),
    );
  }
}
