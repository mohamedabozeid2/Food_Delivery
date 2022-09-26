import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/Presentation/CartScreen/EmptyCart.dart';
import 'package:food_delivery/Presentation/CartScreen/Wdigets/CartItemBuilder.dart';
import 'package:food_delivery/Presentation/FoodLayoutScreen/Cubit/FoodLayoutCubit.dart';
import 'package:food_delivery/Presentation/FoodLayoutScreen/Cubit/FoodLayoutStates.dart';
import 'package:food_delivery/utils/helper.dart';

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FoodLayoutCubit, FoodLayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Center(
          child: FoodLayoutCubit.get(context).cartModelList.isEmpty
              ? EmptyCart()
              : CustomScrollView(
                  slivers: [
                    SliverFillRemaining(
                      child: Column(
                        children: [
                          Expanded(
                              child: ListView.separated(
                                  itemBuilder: (context, index) {
                                    return CartItemBuilder(
                                      index: index,
                                        model: FoodLayoutCubit.get(context)
                                            .cartModelList[index]);
                                  },
                                  separatorBuilder: (context, index) {
                                    return const SizedBox(
                                      height: 5.0,
                                    );
                                  },
                                  itemCount: FoodLayoutCubit.get(context)
                                      .cartModelList
                                      .length))
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
