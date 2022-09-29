import 'package:flutter/material.dart';
import 'package:food_delivery/Presentation/FoodLayoutScreen/Cubit/FoodLayoutCubit.dart';
import 'package:get/get.dart';

import '../../../core/utils/helper.dart';
import 'SearchBar.dart';

PreferredSizeWidget defaultAppBar(
    {required BuildContext context}) {
  return AppBar(
    toolbarHeight: FoodLayoutCubit.get(context).inProfileScreen||FoodLayoutCubit.get(context).inCartScreen
        ? Helper.getScreenHeight(context: context) * 0.05
        : Helper.getScreenHeight(context: context) * 0.2,
    centerTitle: true,
    title: FoodLayoutCubit.get(context).inCartScreen || FoodLayoutCubit.get(context).inProfileScreen
        ? Text(
      FoodLayoutCubit.get(context).inProfileScreen ? 'profile'.tr :'my_cart'.tr,
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(fontSize: 17.0, fontWeight: FontWeight.w600),
          )
        : Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'delivery_to'.tr,
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            fontSize: 13.0,
                          ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      'Alexandria',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 17.0),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    SearchBar(),
                    const SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              )
            ],
          ),
  );
}
