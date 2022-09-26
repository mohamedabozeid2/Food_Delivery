import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/Presentation/FoodLayoutScreen/Cubit/FoodLayoutCubit.dart';
import 'package:lottie/lottie.dart';
import '../FoodLayoutScreen/Cubit/FoodLayoutStates.dart';
import '../HomeScreen/Widgets/MealBuilder.dart';

class FavoriteScreen extends StatefulWidget {

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FoodLayoutCubit, FoodLayoutStates>(
      listener: (context, state){},
      builder: (context, state){
        return FoodLayoutCubit.get(context).favMeals.isEmpty ? Center(child: LottieBuilder.asset('assets/anims/empty.json')) : Column(
          children: [
            Expanded(
              child: ListView.separated(
                // shrinkWrap: false,
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.all(5),
                  itemBuilder: (context, index) {
                    return MealBuilder(
                        model: FoodLayoutCubit.get(context)
                            .favMeals,
                        index: index,
                        restaurantIndex: int.parse(FoodLayoutCubit.get(context).favMeals[index].restaurantId!));
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 20.0,
                    );
                  },
                  itemCount: FoodLayoutCubit.get(context).favMeals.length),
            )
          ],
        );
      },
    );
  }
}
