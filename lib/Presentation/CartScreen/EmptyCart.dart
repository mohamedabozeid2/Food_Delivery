import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/Presentation/FoodLayoutScreen/Cubit/FoodLayoutCubit.dart';
import 'package:food_delivery/Presentation/FoodLayoutScreen/Cubit/FoodLayoutStates.dart';
import 'package:food_delivery/Presentation/HomeScreen/HomeScreen.dart';
import 'package:food_delivery/Shared/Components/Components.dart';
import 'package:food_delivery/Shared/styles/Themes.dart';

class EmptyCart extends StatefulWidget {
  const EmptyCart({Key? key}) : super(key: key);

  @override
  State<EmptyCart> createState() => _EmptyCartState();
}

class _EmptyCartState extends State<EmptyCart> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FoodLayoutCubit, FoodLayoutStates>(
      listener: (context, state){},
      builder: (context, state){
        return Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/emptyCart.png'),
            const SizedBox(
              height: 15.0,
            ),
            Text('Your cart is empty', style: Theme.of(context).textTheme.bodyText2,),
            const SizedBox(
              height: 10.0,
            ),
            Text('Add something to your cart', style: Theme.of(context).textTheme.subtitle2!.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w400
            ),),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 15),
              child: defaultButton(text: 'Back To Home', fun: (){
                setState(() {
                  FoodLayoutCubit.get(context).changeBotNavBar(index: 0, context: context);
                });
              },backgroundColor: mainColor, TextColor: Colors.white,borderRadius: 5),
            )
          ],
        ));
      },
    );
  }
}
