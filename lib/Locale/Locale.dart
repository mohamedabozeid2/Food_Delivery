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
        'email' : "Email",
        'home' : "Home",
        'favorite' : "Favorite",
        'profile' : "Profile",
        'my_order' : "My Orders",
        'edit' : "Edit",
        'my_cart' : "My Cart",
        'empty_cart' : "Your cart is empty",
        'add_to_cart' : "Add something to your cart",
        'back_home' : "Back To Home",
        'all':'All',
        'near_by':'Near By',
        'most_popular':'Most Popular',
        'free_delivery':'Free Delivery',
        'payment_method' : 'Payment Method',
        'my_address' : 'My Address',
        'new_address' : 'Add New Address +',
        'change_language' : 'Change Language',
        'select_language' : 'Select Language',
        'about_us' : 'About Us',
        'invite_and_share' : 'Invite & Share app',
      },
      'ar' :{
        'delivery_to' : 'التوصيل الي',
        'search' : "البحث",
        'home' : "الرئيسية",
        'edit_profile' : "تعديل الملف الشخصي",
        'full_name' : "الاسم الكامل",
        'phone_number' : "رقم التلفون",
        'email' : "البريد الالكتروني",
        'favorite' : "المفضلة",
        'profile' : "الملف الشخصي",
        'my_order' : "طلباتي",
        'edit' : "تعديل",
        'my_cart' : "سلة المشترياب",
        'empty_cart' : "سلة المشترياب فارغة",
        'add_to_cart' : "ضع بعض المنتحات فى سلة المشتريات",
        'back_home' : 'الرجوع للصفحة الرئيسية',
        'all':'الكل',
        'near_by':'الافرب',
        'most_popular':'الاشهر',
        'free_delivery':'التوصيل المجاني',
        'payment_method' : 'طريقة الدفع',
        'my_address' : 'عنواني',
        'new_address' : 'اضف عنوان جديد +',
        'change_language' : 'تغيير اللغة',
        'select_language' : 'أختر اللغة',
        'about_us' : 'معلومات عنا',
        'invite_and_share' : 'الدعوة و مشاركه البرنامج',
      }
  };

}