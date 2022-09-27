import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/Presentation/CartScreen/EmptyCart.dart';
import 'package:food_delivery/Presentation/CartScreen/Wdigets/CartItemBuilder.dart';
import 'package:food_delivery/Presentation/FoodLayoutScreen/Cubit/FoodLayoutCubit.dart';
import 'package:food_delivery/Presentation/FoodLayoutScreen/Cubit/FoodLayoutStates.dart';
import 'package:food_delivery/Shared/Components/Components.dart';
import 'package:food_delivery/Shared/styles/Themes.dart';
import 'package:food_delivery/core/utils/helper.dart';

import '../../Shared/Constants/Constants.dart';

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  @override
  void initState() {
    FoodLayoutCubit.get(context).calcCheckPrice(
        cartModelList: FoodLayoutCubit.get(context).cartModelList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FoodLayoutCubit, FoodLayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return FoodLayoutCubit.get(context).cartModelList.isEmpty
            ? EmptyCart()
            : SingleChildScrollView(
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    ListView.separated(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return CartItemBuilder(
                            index: index,
                            model: FoodLayoutCubit.get(context)
                                .cartModelList[index],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 5.0,
                          );
                        },
                        itemCount: FoodLayoutCubit.get(context)
                            .cartModelList
                            .length),
                    myDivider(color: greyTextColor),
                    Container(
                      width: Helper.getScreenWidth(context: context) * 0.95,
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Payment Summary',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: [
                              Text(
                                'Sub-Total (${FoodLayoutCubit.get(context).cartModelList.length} items)',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400),
                              ),
                              const Spacer(),
                              Text(
                                'EGP $totalCartPrice',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: [
                              Text(
                                'Delivery',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400),
                              ),
                              const Spacer(),
                              Text(
                                'Free',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                          myDivider(color: greyTextColor),
                          Row(
                            children: [
                              Text(
                                'Total',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600),
                              ),
                              const Spacer(),
                              Text(
                                'EGP $totalCartPrice',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(fontSize: 16.0),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            height:
                                Helper.getScreenHeight(context: context) *
                                    0.1,
                            padding:
                                const EdgeInsets.symmetric(vertical: 20.0),
                            child: Row(
                              children: [
                                Expanded(
                                    child: buttonContainer(
                                        fun: () {
                                          FoodLayoutCubit.get(context).changeBotNavBar(index: 0, context: context);
                                        },
                                        context: context,
                                        color: Colors.white,
                                        child: Center(
                                            child: Text(
                                          '+ Add Item',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2!
                                              .copyWith(
                                                  fontSize: 16.0,
                                                  color: mainColor,
                                                  fontWeight:
                                                      FontWeight.w500),
                                        )))),
                                const SizedBox(
                                  width: 15.0,
                                ),
                                Expanded(
                                    child: buttonContainer(
                                        fun: () {},
                                        context: context,
                                        color: mainColor,
                                        child: Center(
                                            child: Text(
                                          'Check Out',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2!
                                              .copyWith(
                                                  fontSize: 16.0,
                                                  color: Colors.white,
                                                  fontWeight:
                                                      FontWeight.w500),
                                        ))))
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
      },
    );
  }
}
