import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery/Locale/LocaleController.dart';
import 'package:food_delivery/Shared/Constants/Constants.dart';
import 'package:food_delivery/Shared/styles/Themes.dart';
import 'package:get/get.dart';

class ChangeLanguageScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    MyLocaleController localeController = Get.find();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: Text(
          'Change Language',
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
              color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Language',
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
        localeController.changeLanguage(
            language: text == 'English' ? 'en' : 'ar');
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
