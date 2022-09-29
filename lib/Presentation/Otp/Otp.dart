import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/Presentation/FoodLayoutScreen/Cubit/FoodLayoutCubit.dart';
import 'package:food_delivery/Presentation/Otp/Pinput.dart';
import 'package:food_delivery/Shared/Components/Components.dart';

import '../FoodLayoutScreen/Cubit/FoodLayoutStates.dart';

class OtpScreen extends StatefulWidget {
  final bool fromUpdate;
  final String name;
  final String phone;
  final String email;
  final String address;

  OtpScreen(
      {required this.fromUpdate,
      required this.email,
      required this.phone,
      required this.address,
      required this.name});

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
    return BlocConsumer<FoodLayoutCubit, FoodLayoutStates>(
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
                      name: widget.name,
                      phone: widget.phone,
                      email: widget.email,
                      address: widget.address,
                      authenticationCode:
                          FoodLayoutCubit.get(context).verificationCode!,
                      fromUpdate: widget.fromUpdate),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
