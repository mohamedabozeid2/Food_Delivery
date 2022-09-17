import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery/Modules/HomeScreen/HomeScreen.dart';
import 'package:food_delivery/Modules/LoginScreen/LoginScreen.dart';
import 'package:food_delivery/Modules/Otp/Otp.dart';
import 'package:food_delivery/Modules/SplashScreen/SplashScreen.dart';
import 'package:food_delivery/Shared/Constants/Constants.dart';
import 'package:food_delivery/Shared/styles/Themes.dart';
import 'package:get/get.dart';

import 'Modules/OnBoardingScreen/OnBoardingScreen.dart';
import 'Shared/BlocObserver/BlocObserver.dart';
import 'Shared/Network/Local/CacheHelper.dart';
import 'firebase_options.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // sta
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark// tus bar color
  ));

  await CacheHelper.init();
  Widget startWidget;
  if(CacheHelper.getData(key: 'onBoarding') == null){
    onBoarding = false;
  }else{
    onBoarding = true;
  }

  if (onBoarding == true) {
    if (uId != null) {
      startWidget = HomeScreen();
    } else {
      startWidget = LoginScreen();
    }
  } else {
    startWidget = OnBoardingScreen();
  }
  BlocOverrides.runZoned(
        () {
      runApp(MyApp(
        startWidget: startWidget,
      ));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  Widget startWidget;
  MyApp({required this.startWidget});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Delivery',
      theme: lightTheme,
      themeMode: ThemeMode.light,
      home: startWidget,
    );
  }
}

