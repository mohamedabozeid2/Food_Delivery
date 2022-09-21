import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Color mainColor = Color(0xffFC6011);
Color inActiveColor = Color(0xff707070);
Color greyTextColor = Color(0xff8E8E93);

// ThemeData darkTheme = ThemeData(
//   primarySwatch: defaultBlueColor,
//   scaffoldBackgroundColor: Colors.black,
//   bottomNavigationBarTheme: BottomNavigationBarThemeData(
//       selectedItemColor: defaultDarkColor,
//       backgroundColor: Colors.black,
//       elevation: 20.0,
//       type: BottomNavigationBarType.fixed,
//       unselectedItemColor: Colors.grey),
//   appBarTheme: AppBarTheme(
//       elevation: 0.0,
//       titleSpacing: 20.0,
//       systemOverlayStyle: const SystemUiOverlayStyle(
//           statusBarColor: Colors.black,
//           statusBarIconBrightness: Brightness.light),
//       backgroundColor: Colors.black,
//       titleTextStyle: TextStyle(
//           color: defaultDarkColor,
//           fontSize: 22.0,
//           fontWeight: FontWeight.bold,
//           fontFamily: "Jannah"),
//       actionsIconTheme: IconThemeData(color: defaultDarkColor)),
//   textTheme: const TextTheme(
//       subtitle1: TextStyle(
//           fontSize: 14.0,
//           fontWeight: FontWeight.w600,
//           color: Colors.white,
//           height: 1.3
//       ),
//       bodyText1: TextStyle(
//         fontSize: 20.0,
//         fontWeight: FontWeight.bold,
//         color: Colors.white,
//       ),
//       bodyText2: TextStyle(
//           fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.white)),
//   fontFamily: 'Jannah',
// );

ThemeData lightTheme = ThemeData(
  textTheme: const TextTheme(
      bodyText1: TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      bodyText2: TextStyle(
          fontSize: 20.0, fontWeight: FontWeight.w600, color: Colors.black),
      subtitle2: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w600,
          color: Colors.black,
          ),
      ),
  // primarySwatch: Colors.blue,
  // floatingActionButtonTheme:
  // FloatingActionButtonThemeData(backgroundColor: defaultColor),
  scaffoldBackgroundColor: Colors.white,

  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: Colors.white),
    actionsIconTheme: IconThemeData(color: Colors.white),
    titleSpacing: 20.0,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    elevation: 0.0,
    backgroundColor: Colors.transparent,
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark
    ),
  ),
  // bottomNavigationBarTheme: BottomNavigationBarThemeData(
  //     type: BottomNavigationBarType.fixed,
  //     backgroundColor: Colors.white,
  //     selectedItemColor: defaultColor,
  //     elevation: 20.0),
);
