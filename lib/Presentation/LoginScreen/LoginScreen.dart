import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/Presentation/Otp/Loading.dart';
import 'package:food_delivery/Presentation/Otp/Otp.dart';
import 'package:get/get.dart';

import '../../Shared/Components/Components.dart';
import '../../Shared/styles/Themes.dart';
import '../../core/utils/helper.dart';
import 'LoginCubit/LoginCubit.dart';
import 'LoginCubit/LoginStates.dart';

class LoginScreen extends StatelessWidget {
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FoodLoginCubit, FoodLoginStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                    alignment: Alignment.center,
                    child: logoDisplay(context: context)
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    'Enter Your Phone Number',
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Text(
                    'we will send a code (via SMS message) to your phone ',
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Material(
                  elevation: 15.0,
                  child: textFormFieldWithHint(
                    context: context,
                    controller: phoneController,
                    label: ' Mobile Number',
                    type: TextInputType.phone,
                    prefixWidget: Text('+20'),
                    prefixIcon: Icon(Icons.phone, color: mainColor),
                  ),
                ),
                const SizedBox(
                  height: 25.0,
                ),
                state is FoodSendPhoneAuthenticationLoadingState ? const Center(child: CircularProgressIndicator()) :defaultButton(
                    text: 'Log in',
                    fun: () {
                      navigateAndFinish(context: context, widget: LoadingScreen(phoneNumber: phoneController.text));
                      // navigateAndFinish(context: context, widget: OtpScreen(phoneNumber: phoneController.text));
                      // FoodLoginCubit.get(context).phoneAuthentication(
                      //     phoneNumber: phoneController.text);
                    },
                    height: 50.0,
                    TextColor: Colors.white,
                    borderRadius: 5.0,
                    backgroundColor: mainColor)
              ],
            ),
          ),
        );
      },
    );
  }
}
