import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import '../../Shared/Components/Components.dart';
import '../FoodLayoutScreen/Layout.dart';
import '../LoginScreen/LoginCubit/LoginCubit.dart';
import '../LoginScreen/LoginCubit/LoginStates.dart';

class PinputWidget extends StatelessWidget {
  final String authenticationCode;

  PinputWidget({required this.authenticationCode});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FoodLoginCubit, FoodLoginStates>(
      listener: (context, state){
        if(state is FoodVerifyPhoneSuccessState){
          navigateAndFinish(context: context, widget: LayoutScreen());
        }
      },
      builder: (context, state){
        return Pinput(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          length: 6,
          onCompleted: (pin)  {
            FoodLoginCubit.get(context).phoneAuthentication(pin: pin);
          },
        );
      },
    );
  }
}
