import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/Presentation/LoginScreen/LoginCubit/LoginCubit.dart';
import 'package:food_delivery/Presentation/LoginScreen/LoginCubit/LoginStates.dart';
import 'package:food_delivery/Presentation/Otp/Otp.dart';
import 'package:food_delivery/Shared/Components/Components.dart';
import 'package:lottie/lottie.dart';

class LoadingScreen extends StatefulWidget {
  final String phoneNumber;

  LoadingScreen({required this.phoneNumber});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

//316083
class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    FoodLoginCubit.get(context)
        .sendPhoneAuthenticationCode(phoneNumber: widget.phoneNumber);
    Timer.periodic(
      Duration(seconds: 2),
      (timer) {
        if (FoodLoginCubit.get(context).verificationCode != null) {
          navigateAndFinish(context: context, widget: OtpScreen());
          timer.cancel();
        }
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FoodLoginCubit, FoodLoginStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LottieBuilder.asset('assets/anims/loading.json'),
            ],
          )),
        );
      },
    );
  }
}
