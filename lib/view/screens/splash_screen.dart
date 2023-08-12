import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iti_project_newsapp/view/screens/categories_screen.dart';
import 'package:iti_project_newsapp/view/screens/onboarding_screen.dart';
import 'package:lottie/lottie.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  State<splashScreen> createState() => _splashScreenState();
}


class _splashScreenState extends State<splashScreen> {
  bool isLoading=true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration( seconds: 5),(){
      setState(() {
        isLoading=false;
      });
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>onboardingScreen()));
    });
    Future.delayed(Duration(seconds:5),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>onboardingScreen()));

      setState(() {
        isLoading=false;
      });
    });
  }
  Widget build(BuildContext context) {
    return isLoading?
    Center(
      child: Container(
        height:double.infinity,
        color: Colors.white,
          child: Lottie.asset("assets/images/online-news-8644121-6879411.mp4.lottie.json")),
    ):categoriesScreen();
  }
}
