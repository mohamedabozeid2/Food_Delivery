import 'package:flutter/material.dart';
import 'package:food_delivery/Presentation/FoodLayoutScreen/Layout.dart';
import 'package:food_delivery/Shared/Components/Components.dart';
import 'package:food_delivery/Shared/Network/Local/CacheHelper.dart';
import 'package:get/get.dart';

import '../Shared/Constants/Constants.dart';

class MyLocaleController extends GetxController{

  // String initialLanguage = CacheHelper.getData(key: 'language') == 'en' ?
  void changeLanguage({required String language,required BuildContext context}){
    Locale locale = Locale(language);
    selectedLanguage = language;
    CacheHelper.saveData(key: 'language', value: language);
    Get.updateLocale(locale);
    navigateAndFinish(context: context, widget: LayoutScreen());
  }
}