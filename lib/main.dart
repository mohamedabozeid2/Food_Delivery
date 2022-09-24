import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/Modules/LoginScreen/LoginCubit/LoginCubit.dart';
import 'package:food_delivery/Modules/LoginScreen/LoginScreen.dart';
import 'package:food_delivery/Modules/MapScreen/MapScreen.dart';
import 'package:food_delivery/Modules/MapScreen/cubit/MapCubit.dart';
import 'package:food_delivery/Modules/Otp/Loading.dart';
import 'package:food_delivery/Modules/Otp/Otp.dart';
import 'package:food_delivery/Modules/SplashScreen/SplashScreen.dart';
import 'package:food_delivery/Shared/Constants/Constants.dart';
import 'package:food_delivery/Shared/styles/Themes.dart';
import 'package:get/get.dart';

import 'Modules/FoodLayoutScreen/Cubit/FoodLayoutCubit.dart';
import 'Modules/FoodLayoutScreen/Layout.dart';
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
      statusBarColor: Colors.transparent, // st
      // a
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
  if(CacheHelper.getData(key: 'loggedIn') == null){
    loggedIn = false;
  }else{
    loggedIn == true;
  }

  if (onBoarding == true) {
    if (loggedIn ==true) {
      startWidget = LayoutScreen();
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
//813031
class MyApp extends StatelessWidget {
  Widget startWidget;
  MyApp({required this.startWidget});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> MapCubit()),
        BlocProvider(create: (context)=> FoodLoginCubit()),
        BlocProvider(create: (context)=> FoodLayoutCubit()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Food Delivery',
        theme: lightTheme,
        themeMode: ThemeMode.light,
        home: startWidget,
      ),
    );
  }
}

