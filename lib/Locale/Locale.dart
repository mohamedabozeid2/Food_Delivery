import 'package:get/get.dart';

class MyLocale implements Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
      'en' :{
        'delivery_to' : 'Delivery to',
        'search' : "Search"
      },
      'ar' :{
        'delivery_to' : 'التوصيل الي',
        'search' : "البحث"

      }
  };

}