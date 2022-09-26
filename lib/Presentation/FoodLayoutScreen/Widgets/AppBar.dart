import 'package:flutter/material.dart';
import 'package:food_delivery/Presentation/FoodLayoutScreen/Cubit/FoodLayoutCubit.dart';

import '../../../utils/helper.dart';
import 'SearchBar.dart';

PreferredSizeWidget defaultAppBar(
    {required BuildContext context, required bool inCartScreen}) {
  return AppBar(
    toolbarHeight: inCartScreen
        ? Helper.getScreenHeight(context: context) * 0.1
        : Helper.getScreenHeight(context: context) * 0.2,
    centerTitle: true,
    title: inCartScreen
        ? Text(
            'My Cart',
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
                      'Delivery to',
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
