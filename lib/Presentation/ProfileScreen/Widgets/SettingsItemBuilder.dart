import 'package:flutter/material.dart';
import 'package:food_delivery/Shared/Components/Components.dart';
import 'package:food_delivery/Shared/Constants/Constants.dart';
import 'package:food_delivery/Shared/styles/Themes.dart';
import 'package:food_delivery/core/utils/helper.dart';

Widget settingsItemBuilder(
    {required IconData icon,
    required String text,
    required BuildContext context,
    required Widget screen,
    }) {
  return GestureDetector(
    onTap: () {
      navigateTo(context, screen);
    },
    child: Container(
      width: Helper.getScreenWidth(context: context)*0.95,
      child: Stack(
        alignment: selectedLanguage == 'en' ? Alignment.centerRight : Alignment.centerLeft,
        children: [
          Align(
            alignment: selectedLanguage == 'en' ? Alignment.centerLeft : Alignment.centerRight,
            child: Container(
              width: Helper.getScreenWidth(context: context)*0.85,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: greyTextColor.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(50)
                    ),
                      child: Icon(
                    icon,
                  )),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Text(
                    text,
                    style:
                        Theme.of(context).textTheme.caption!.copyWith(fontSize: 16.0),
                  ),

                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.grey[300],
              borderRadius: BorderRadius.circular(50)
            ),
            child: Icon(
              Icons.arrow_forward_ios_outlined,
              color: greyTextColor,
            ),
          )
        ],
      ),
    ),
  );
}
