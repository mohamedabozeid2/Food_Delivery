import 'package:flutter/material.dart';
import 'package:food_delivery/Shared/styles/Themes.dart';
import 'package:get/get.dart';

import '../../../Shared/Components/Components.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileContentAppBar(context: context, title: 'about_us'.tr),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              randomTextItemBuilder(
                  context: context,
                  text:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Purus ut faucibus pulvinar elementum integer enim neque volutpat ac. Neque viverra justo nec ultrices dui sapien eget. Pharetra vel turpis nunc eget lorem dolor. Felis eget velit aliquet sagittis id consectetur purus. Tristique nulla aliquet enim tortor at auctor urna nunc. Sed ullamcorper morbi tincidunt ornare. Pretium nibh ipsum consequat nisl vel pretium lectus.'),
              const SizedBox(
                height: 20.0,
              ),
              randomTextItemBuilder(
                  context: context,
                  text:
                      'Ornare arcu dui vivamus arcu felis bibendum ut tristique et. Leo duis ut diam quam nulla porttitor. Lectus proin nibh nisl condimentum id venenatis a condimentum. Egestas purus viverra accumsan in nisl nisi. Arcu bibendum at varius vel pharetra vel turpis nunc. Ornare massa eget egestas purus. Risus in hendrerit gravida rutrum quisque non tellus.'),
              const SizedBox(
                height: 20.0,
              ),
              randomTextItemBuilder(
                  context: context,
                  text:
                      'Rhoncus est pellentesque elit ullamcorper dignissim cras tincidunt lobortis. Ac turpis egestas sed tempus urna et. Venenatis cras sed felis eget. Donec pretium vulputate sapien nec sagittis aliquam. Pellentesque diam volutpat commodo sed egestas egestas fringilla. Pretium vulputate sapien nec sagittis aliquam. Vestibulum sed arcu non odio euismod lacinia at. Tortor vitae purus faucibus ornare suspendisse sed nisi lacus. Justo donec enim diam vulputate ut.'),
            ],
          ),
        ),
      ),
    );
  }

  Widget randomTextItemBuilder(
      {required BuildContext context, required String text}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        dotBuilder(),
        const SizedBox(
          width: 8.0,
        ),
        Expanded(
          child: Text(
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(fontWeight: FontWeight.w400, height: 1.5),
              text),
        ),
      ],
    );
  }

  Widget dotBuilder() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: mainColor, borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}
