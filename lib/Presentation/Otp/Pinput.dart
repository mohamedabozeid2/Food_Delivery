import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/Presentation/FoodLayoutScreen/Cubit/FoodLayoutCubit.dart';
import 'package:food_delivery/Presentation/FoodLayoutScreen/Cubit/FoodLayoutStates.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import '../../Shared/Components/Components.dart';
import '../FoodLayoutScreen/Layout.dart';

class PinputWidget extends StatelessWidget {
  final String authenticationCode;
  final bool fromUpdate;
  final String name;
  final String phone;
  final String email;

  PinputWidget(
      {required this.authenticationCode, required this.fromUpdate, required this.name, required this.phone, required this.email});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FoodLayoutCubit, FoodLayoutStates>(
      listener: (context, state) {
        if (state is FoodVerifyPhoneSuccessState) {
          navigateAndFinish(context: context, widget: LayoutScreen());
        }
      },
      builder: (context, state) {
        return Pinput(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          length: 6,
          onCompleted: (pin) {
            FoodLayoutCubit.get(context).phoneAuthentication(
                pin: pin,
                fromUpdate: fromUpdate,
                context: context,
                email: email,
                name: name,
                phone: phone);
          },
        );
      },
    );
  }
}
