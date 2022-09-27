import 'package:flutter/material.dart';

class Helper{
  static double getScreenWidth({required BuildContext context}){
    return MediaQuery.of(context).size.width;
  }
  static double getScreenHeight({required BuildContext context}){
    return MediaQuery.of(context).size.height;
  }
}
