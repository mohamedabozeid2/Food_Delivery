import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/Presentation/FoodLayoutScreen/Cubit/FoodLayoutCubit.dart';
import 'package:food_delivery/Presentation/FoodLayoutScreen/Cubit/FoodLayoutStates.dart';
import 'package:food_delivery/Presentation/Otp/Loading.dart';


import '../../Shared/Components/Components.dart';
import '../../Shared/styles/Themes.dart';
import '../../core/utils/helper.dart';

class LoginScreen extends StatelessWidget {
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FoodLayoutCubit, FoodLayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding:  EdgeInsets.all(Helper.getScreenWidth(context: context)*0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                    alignment: Alignment.center,
                    child: logoDisplay(context: context)),
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: Helper.getScreenWidth(context: context)*0.025),
                  child: Text(
                    'Enter Your Phone Number',
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: Helper.getScreenWidth(context: context)*0.02),
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
                    prefixWidget: const Text('+20'),
                    prefixIcon: Icon(Icons.phone, color: mainColor),
                  ),
                ),
                const SizedBox(
                  height: 25.0,
                ),
                state is FoodSendPhoneAuthenticationLoadingState
                    ? const Center(child: CircularProgressIndicator())
                    : defaultButton(
                        text: 'Log in',
                        fun: () {
                          navigateAndFinish(
                              context: context,
                              widget: LoadingScreen(
                                  fromUpdate: false,
                                  name: 'User Name',
                                  address: '',
                                  emailAddress: 'Email Address',
                                  phoneNumber: phoneController.text));
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
