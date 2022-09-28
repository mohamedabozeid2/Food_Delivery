import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/Locale/Locale.dart';
import 'package:food_delivery/Locale/LocaleController.dart';
import 'package:food_delivery/Presentation/LoginScreen/LoginCubit/LoginCubit.dart';
import 'package:food_delivery/Presentation/LoginScreen/LoginScreen.dart';
import 'package:food_delivery/Presentation/MapScreen/cubit/MapCubit.dart';
import 'package:food_delivery/Shared/Constants/Constants.dart';
import 'package:food_delivery/Shared/styles/Themes.dart';
import 'package:get/get.dart';

import 'Presentation/FoodLayoutScreen/Cubit/FoodLayoutCubit.dart';
import 'Presentation/FoodLayoutScreen/Layout.dart';
import 'Presentation/OnBoardingScreen/OnBoardingScreen.dart';
import 'Shared/BlocObserver/BlocObserver.dart';
import 'Shared/Network/Local/CacheHelper.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // st
      // a
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark // tus bar color
      ));

  ////////////// Local Database/////////////////

  await CacheHelper.init();
  Widget startWidget;
  if (CacheHelper.getData(key: 'onBoarding') == null) {
    onBoarding = false;
  } else {
    onBoarding = true;
  }

  selectedLanguage = CacheHelper.getData(key: 'language');
  if(selectedLanguage == null){
    selectedLanguage = 'en';
    CacheHelper.saveData(key: 'language', value: 'en');
  }

  uId = CacheHelper.getData(key: 'uId');
  if (CacheHelper.getData(key: 'loggedIn') == null) {
    loggedIn = false;
  } else if (CacheHelper.getData(key: 'loggedIn') == false) {
    loggedIn = false;
  } else {
    loggedIn = true;
  }

  if (onBoarding == true) {
    if (loggedIn == true) {
      startWidget = LayoutScreen();
    } else {
      startWidget = LoginScreen();
    }
  } else {
    startWidget = OnBoardingScreen();
  }


  /////////////////////////////////////
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
    Get.put(MyLocaleController());
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MapCubit()),
        BlocProvider(create: (context) => FoodLoginCubit()..getUserData()),
        BlocProvider(create: (context) => FoodLayoutCubit()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Food Delivery',
        theme: lightTheme,
        locale: Locale(selectedLanguage),
        translations: MyLocale(),
        themeMode: ThemeMode.light,
        home: startWidget,
      ),
    );
  }
}
