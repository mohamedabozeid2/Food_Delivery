import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/Presentation/FoodLayoutScreen/Cubit/FoodLayoutCubit.dart';
import 'package:food_delivery/Presentation/Otp/Otp.dart';
import 'package:food_delivery/Shared/Components/Components.dart';
import 'package:lottie/lottie.dart';

import '../FoodLayoutScreen/Cubit/FoodLayoutStates.dart';

class LoadingScreen extends StatefulWidget {
  final String phoneNumber;
  final bool fromUpdate;
  final String name;
  final String address;
  final String emailAddress;

  LoadingScreen(
      {required this.phoneNumber,
      required this.fromUpdate,
      required this.name,
      required this.address,
      required this.emailAddress});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

//316083
class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    FoodLayoutCubit.get(context).sendPhoneAuthenticationCode(
        phoneNumber: widget.phoneNumber, context: context);
    Timer.periodic(
      const Duration(seconds: 2),
      (timer) {
        if (FoodLayoutCubit.get(context).verificationCode != null) {
          navigateAndFinish(
              context: context,
              widget: OtpScreen(
                name: widget.name,
                address: widget.address,
                phone: widget.phoneNumber,
                email: widget.emailAddress,
                fromUpdate: widget.fromUpdate,
              ));
          timer.cancel();
        }
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FoodLayoutCubit, FoodLayoutStates>(
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
