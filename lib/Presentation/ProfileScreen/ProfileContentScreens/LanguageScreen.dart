import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery/Locale/LocaleController.dart';
import 'package:food_delivery/Shared/Components/Components.dart';
import 'package:food_delivery/Shared/Constants/Constants.dart';
import 'package:food_delivery/Shared/styles/Themes.dart';
import 'package:get/get.dart';

class ChangeLanguageScreen extends StatefulWidget {

  @override
  State<ChangeLanguageScreen> createState() => _ChangeLanguageScreenState();
}

class _ChangeLanguageScreenState extends State<ChangeLanguageScreen> {
  @override
  Widget build(BuildContext context) {
    MyLocaleController localeController = Get.find();
    return Scaffold(
      appBar: profileContentAppBar(context: context, title: 'change_language'.tr),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'select_language'.tr,
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(color: mainColor, fontSize: 18.0),
            ),
            const SizedBox(
              height: 10.0,
            ),
            languageItemBuilder(
                text: 'English',
                context: context,
                localeController: localeController,
                color: selectedLanguage == 'en' ? mainColor : greyTextColor),
            const SizedBox(
              height: 10.0,
            ),
            languageItemBuilder(
                text: 'العربية',
                context: context,
                localeController: localeController,
                color: selectedLanguage == 'ar' ? mainColor : greyTextColor),
          ],
        ),
      ),
    );
  }

  Widget languageItemBuilder({
    required String text,
    required BuildContext context,
    required Color color,
    required MyLocaleController localeController,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          localeController.changeLanguage(context: context,
              language: text == 'English' ? 'en' : 'ar');
        });
      },
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10.0)),
        child: Row(
          children: [
            Text(
              text,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                color: Colors.white,
              ),
              child: Icon(Icons.check),
            ),
          ],
        ),
      ),
    );
  }
}
