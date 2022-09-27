import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/DataModels/CartModel.dart';
import 'package:food_delivery/Presentation/FoodLayoutScreen/Cubit/FoodLayoutCubit.dart';
import 'package:food_delivery/Presentation/FoodLayoutScreen/Cubit/FoodLayoutStates.dart';
import 'package:food_delivery/Shared/Constants/Constants.dart';
import 'package:food_delivery/core/utils/helper.dart';

import '../../../Shared/Components/Components.dart';
import '../../../Shared/styles/Themes.dart';

class CartItemBuilder extends StatefulWidget {
  CartModel model;
  int index;

  CartItemBuilder({required this.model, required this.index});

  @override
  State<CartItemBuilder> createState() => _CartItemBuilderState();
}

class _CartItemBuilderState extends State<CartItemBuilder> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FoodLayoutCubit, FoodLayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(15.0),
          child: Material(
            borderRadius: BorderRadius.circular(20.0),
            elevation: 8.0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Image.network(
                      widget.model.mealModel.image!,
                      width: Helper.getScreenWidth(context: context) * 0.3,
                    ),
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.model.mealModel.name!,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(
                                  fontSize: 18.0, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'EGP ${widget.model.totalPrice!}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(
                                  fontSize: 16.0, fontWeight: FontWeight.w400),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            quantityButton(
                                icon: Icons.minimize,
                                fun: () {
                                  if (widget.model.quantity > 0) {
                                    setState(() {
                                      widget.model.quantity--;
                                      widget.model.totalPrice =
                                          FoodLayoutCubit.get(context)
                                              .calcTotalPrice(
                                                  price: widget.model.price,
                                                  quantity:
                                                      widget.model.quantity);
                                      FoodLayoutCubit.get(context).calcCheckPrice(cartModelList: FoodLayoutCubit.get(context).cartModelList);
                                    });
                                  }
                                },
                                context: context,
                                backgroundColor: greyTextColor),
                            const SizedBox(
                              width: 30,
                            ),
                            Text('${widget.model.quantity}'),
                            const SizedBox(
                              width: 30,
                            ),
                            quantityButton(
                                icon: Icons.add,
                                fun: () {
                                  setState(() {
                                    widget.model.quantity++;
                                    widget.model.totalPrice =
                                        FoodLayoutCubit.get(context)
                                            .calcTotalPrice(
                                                price: widget.model.price,
                                                quantity:
                                                    widget.model.quantity);
                                    FoodLayoutCubit.get(context).calcCheckPrice(cartModelList: FoodLayoutCubit.get(context).cartModelList);

                                  });
                                },
                                context: context,
                                backgroundColor: mainColor),
                          ],
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    child: Icon(Icons.delete, color: greyTextColor),
                    onTap: () {
                      setState(() {
                        FoodLayoutCubit.get(context)
                            .removeFromCart(index: widget.index);
                      });
                    },
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
