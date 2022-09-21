import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery/Modules/OnBoardingScreen/OnBoardingScreen.dart';
import 'package:food_delivery/Shared/Components/Components.dart';
import 'package:food_delivery/utils/helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? timer;
  @override
  void initState() {
    timer = Timer(const Duration(milliseconds: 2500), (){
      navigateAndFinish(context: context, widget: OnBoardingScreen());
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background.png'))),
          child: Center(child: Image(image: const AssetImage('assets/images/logo.png'),height: Helper.getScreenHeight(context: context)*0.3)),
        ),
      ),
    );
  }
}
