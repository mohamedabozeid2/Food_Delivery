import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_delivery/Presentation/FoodLayoutScreen/Cubit/FoodLayoutCubit.dart';
import 'package:food_delivery/Shared/styles/Themes.dart';

import '../../core/utils/helper.dart';

Widget myDivider(
    {required Color color,
    double paddingVertical = 8.0,
    double paddingHorizontal = 8.0}) {
  return Padding(
    padding: EdgeInsets.symmetric(
        vertical: paddingVertical, horizontal: paddingHorizontal),
    child: Container(
      height: 2,
      color: color,
    ),
  );
}

void navigateAndFinish({required context, required widget}) {
  Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => widget), (route) => false);
}

void navigateTo(context, widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return widget;
  }));
}

void showToast({
  required String msg,
  Color color = Colors.white,
  Color textColor = Colors.black,
}) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: color,
      textColor: textColor,
      fontSize: 16.0);
}

Widget defaultButton({
  double width = double.infinity,
  double height = 55,
  Color backgroundColor = Colors.blue,
  double borderRadius = 20.0,
  required String text,
  bool isUpperCase = false,
  Color TextColor = Colors.black,
  required fun,
}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(borderRadius),
      color: backgroundColor,
    ),
    child: MaterialButton(
      onPressed: fun,
      child: Text(
        isUpperCase ? text.toUpperCase() : text,
        style: TextStyle(
          color: TextColor,
          fontSize: 15,
        ),
      ),
    ),
  );
}

Widget defaultTextButton(
    {required String text,
    required fun,
    double fontSize = 14,
    Color textColor = Colors.blue,
    FontWeight weight = FontWeight.w300}) {
  return TextButton(
      onPressed: fun,
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: fontSize,
          fontWeight: weight,
        ),
      ));
}

Widget textFormField({
  required BuildContext? context,
  required TextEditingController controller,
  bool isPassword = false,
  String validation = "",
  required String label,
  required TextInputType type,
  TextStyle? style,
  IconData? prefixIcon,
  double? paddingInside,
  IconData? suffixIcon,
  void Function()? fun,
  double borderRadius = 5.0,
}) {
  return TextFormField(
    controller: controller,
    keyboardType: type,
    obscureText: isPassword,
    validator: (String? value) {
      if (value!.isEmpty) {
        return validation;
      }
    },
    decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        label: Text(
          label,
          style: style,
        ),
        prefixIcon: Icon(
          prefixIcon,
          color: mainColor,
        ),
        suffixIcon: IconButton(
          onPressed: fun,
          icon: Icon(
              suffixIcon == null ? suffixIcon = null : suffixIcon = suffixIcon,
              color: mainColor),
        ),
        contentPadding: paddingInside != null
            ? EdgeInsets.symmetric(vertical: paddingInside)
            : null,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: mainColor),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: mainColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color: mainColor))),
  );
}

Widget textFormFieldWithHint({
  required BuildContext? context,
  required TextEditingController controller,
  bool isPassword = false,
  String validation = "",
  required String label,
  iconColor = Colors.blue,
  required TextInputType type,
  TextStyle? style,
  Widget? prefixIcon,
  Widget? prefixWidget,
  Color borderColor = Colors.white,
  double? paddingInside,
  IconData? suffixIcon,
  void Function()? fun,
  double borderRadius = 5.0,
}) {
  return TextFormField(
    controller: controller,
    keyboardType: type,
    obscureText: isPassword,
    validator: (String? value) {
      if (value!.isEmpty) {
        return validation;
      }
    },
    style: TextStyle(color: mainColor),
    onChanged: (value) {
      print(value);
    },
    decoration: InputDecoration(
        fillColor: Colors.transparent,
        filled: true,
        hintText: label,
        hintStyle: style,
        prefix: prefixWidget,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: prefixIcon ?? prefixIcon,
        ),
        suffixIcon: IconButton(
          onPressed: fun,
          icon: Icon(
              suffixIcon == null ? suffixIcon = null : suffixIcon = suffixIcon,
              color: mainColor),
        ),
        contentPadding: paddingInside != null
            ? EdgeInsets.symmetric(vertical: paddingInside)
            : null,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: borderColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color: borderColor))),
  );
}

Widget logoDisplay({required BuildContext context}) {
  return Image(
    image: AssetImage('assets/images/logo.png'),
    height: Helper.getScreenHeight(context: context) * 0.28,
  );
}

Widget favoriteButton({required fun, required Color iconColor}) {
  return IconButton(
      onPressed: fun,
      icon: Icon(
        Icons.favorite,
        color: iconColor,
      ));
}

Widget quantityButton(
    {required IconData icon,
    required fun,
    required BuildContext context,
    required backgroundColor}) {
  return GestureDetector(
    onTap: fun,
    child: Container(
      width: Helper.getScreenWidth(context: context) * 0.1,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: backgroundColor,
      ),
      child: Icon(icon, color: Colors.white),
    ),
  );
}

Widget buttonContainer({
  required fun,
  required BuildContext context,
  required Color color,
  required Widget child,
}){
  return GestureDetector(
    onTap: fun,
    child: Container(
      decoration: BoxDecoration(
          color: color,
          border: Border.all(color: mainColor),
          borderRadius: BorderRadius.circular(5.0)),
      height: double.maxFinite,
      child: child,
    ),
  );
}

Widget cartButton(
    {required BuildContext context,
    required String text,
      required Color color,
      required fun,
    required String price}) {
  return Column(
    children: [
      Material(
        elevation: 8,
        borderRadius: BorderRadius.circular(80),
        child: GestureDetector(
          onTap: fun,
          child: Container(
            // width: Helper.getScreenWidth(context: context) * 0.14,
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(40.0)),
            child: Text(text,
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(fontSize: 12, fontWeight: FontWeight.w500)),
          ),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Text(
        '$price EGP',
        style: Theme.of(context)
            .textTheme
            .subtitle2!
            .copyWith(fontSize: 13.0, fontWeight: FontWeight.w600),
      )
    ],
  );
}

Widget buttonBuilder({
  required fun,
  double height = 50,
  double width = double.infinity,
  double elevation = 10,
  double fontSize = 20,
  double borderRadius = 15,
  required String text,
  bool isUpper = false,
  Color textColor = Colors.white,
}) {
  return Container(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(borderRadius),
    ),
    child: MaterialButton(
      elevation: elevation,
      color: mainColor,
      height: height,
      minWidth: width,
      onPressed: fun,
      child: Text(
        isUpper ? text.toUpperCase() : text,
        style: TextStyle(color: textColor, fontSize: fontSize),
      ),
    ),
  );
}
