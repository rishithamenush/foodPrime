import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:foodprime/screens/auth/login_page.dart';
import 'package:foodprime/theme/style.dart';
import 'package:foodprime/widgets/button_container_widget.dart';
import 'package:foodprime/widgets/form_container_widget.dart';

import '../premium/premium_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _rememberMeCheckValue = false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(

        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    Center(
                      child: Container(
                        width: 150,
                        height: 50,
                        child: Image.asset("assets/word_app_logo.png", fit: BoxFit.contain,),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const Text("Sign Up",
                    style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    const SizedBox(
                      height: 20,
                    ),
                    const FormContainerWidget(hintText: "UserName"),
                    const SizedBox(
                      height: 20,
                    ),
                    const FormContainerWidget(hintText: "Email"),
                    const SizedBox(
                      height: 20,
                    ),
                    const FormContainerWidget(hintText: "Password"),
                    const SizedBox(
                      height: 20,
                    ),
                    const FormContainerWidget(hintText: "Phone Number"),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment:CrossAxisAlignment.end,
                      children: [
                        Checkbox(
                          onChanged: (value){
                            setState((){
                              _rememberMeCheckValue = value!;
                            });
                          }, value: _rememberMeCheckValue,
                          activeColor: primaryColorED6E1B,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Expanded(
                          child: RichText(
                            maxLines: 2,
                              text: const TextSpan(
                                text: "By signing up you accept the ",
                                style: TextStyle(color: Colors.black),
                                children: [
                                  TextSpan(
                                    text: "Team of service ",
                                    style: TextStyle(color: primaryColorED6E1B)
                                  ),
                                  TextSpan(
                                    text: "and ",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  TextSpan(
                                    text: "Privacy Policy",
                                    style: TextStyle(color: primaryColorED6E1B),
                                  )
                                ]
                              )
                          ),
                        ),
                      ],
                      ),
                    const SizedBox(
                      height: 50,
                    ),
                    ButtonContainerWidget(
                      title: "Sign Up",
                      onTap: (){
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => PremiumScreen()), (route) => false);
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? ",
                    style: TextStyle(fontSize: 15),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => LoginPage()), (route) => false);
                    },
                    child: const Text(
                      "Log In",
                      style: TextStyle(fontSize: 15, color: primaryColorED6E1B),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),

    );
  }
}
