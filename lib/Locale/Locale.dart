import 'package:get/get.dart';

class MyLocale implements Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
      'en' :{
        'delivery_to' : 'Delivery to',
        'search' : "Search",
        'edit_profile' : "Edit Profile",
        'full_name' : "Full Name",
        'phone_number' : "Phone Number",
        'email' : "Email"
      },
      'ar' :{
        'delivery_to' : 'التوصيل الي',
        'search' : "البحث",
        'edit_profile' : "تعديل الملف الشخصي",
        'full_name' : "الاسم الكامل",
        'phone_number' : "رقم التلفون",
        'email' : "البريد الالكتروني"

      }
  };

}