import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/Modules/LoginScreen/LoginCubit/LoginCubit.dart';
import 'package:food_delivery/Modules/Otp/Pinput.dart';
import 'package:food_delivery/Shared/Components/Components.dart';
import 'package:food_delivery/Shared/Constants/Constants.dart';
import 'package:pinput/pinput.dart';

import '../LoginScreen/LoginCubit/LoginStates.dart';

class OtpScreen extends StatefulWidget {
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FoodLoginCubit, FoodLoginStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                      alignment: Alignment.center,
                      child: logoDisplay(context: context)),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Enter Verification Code',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    'A text message with a 6-digit verification code was just sent to your number',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  PinputWidget(
                      authenticationCode:
                          FoodLoginCubit.get(context).verificationCode!),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
