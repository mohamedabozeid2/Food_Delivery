import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/Presentation/FoodLayoutScreen/Cubit/FoodLayoutCubit.dart';
import 'package:food_delivery/Presentation/FoodLayoutScreen/Cubit/FoodLayoutStates.dart';
import 'package:food_delivery/Shared/Constants/Constants.dart';
import 'package:food_delivery/Shared/styles/Themes.dart';
import 'package:food_delivery/core/utils/helper.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FoodLayoutCubit, FoodLayoutStates>(
      listener: (context, state){},
      builder: (context, state){
        return Container(
          width: Helper.getScreenWidth(context: context)*0.95,
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                          Text('User Name', style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: mainColor,

                          ),),
                      Row(
                        children: [
                          Text(FoodLayoutCubit.get(context).)
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
