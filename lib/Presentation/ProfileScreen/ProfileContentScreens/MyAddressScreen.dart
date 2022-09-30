import 'package:flutter/material.dart';
import 'package:food_delivery/Presentation/MapScreen/MapScreen.dart';
import 'package:food_delivery/Shared/Components/Components.dart';
import 'package:food_delivery/Shared/Constants/Constants.dart';
import 'package:food_delivery/Shared/styles/Themes.dart';
import 'package:get/get.dart';

import '../../../core/utils/helper.dart';

class MyAddressScreen extends StatelessWidget {
  const MyAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileContentAppBar(context: context, title: 'my_address'.tr),
      body: Padding(
        padding: EdgeInsets.all(Helper.getScreenWidth(context: context)*0.05),
        child: Column(
          children: [
            buildAddressItem(context: context),
            defaultButton(text: 'new_address'.tr, fun: (){
              navigateTo(context, MapSample());
            },
            borderRadius: 5,
              backgroundColor: mainColor,
              TextColor: Colors.white
            )
          ],
        ),
      ),
    );
  }
  Widget buildAddressItem({
  required BuildContext context,
}){
    return Padding(
      padding: EdgeInsets.all(Helper.getScreenWidth(context: context)*0.025),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Home', style: Theme.of(context).textTheme.bodyText2!.copyWith(

          ),),
          SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              Expanded(
                child: Text(userModel!.address!,style: Theme.of(context).textTheme.subtitle2!.copyWith(
                  color: greyTextColor
                ),),
              ),

            ],
          ),
          myDivider(color: greyTextColor,paddingVertical: 15.0),
        ],
      ),
    );
  }
}
