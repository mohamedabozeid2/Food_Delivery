import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/Presentation/FoodLayoutScreen/Cubit/FoodLayoutCubit.dart';
import 'package:food_delivery/Shared/Components/Components.dart';
import 'package:food_delivery/Shared/Constants/Constants.dart';
import 'package:food_delivery/Shared/styles/Themes.dart';
import 'package:get/get.dart';

import '../../../core/utils/helper.dart';
import '../../FoodLayoutScreen/Cubit/FoodLayoutStates.dart';
import '../../Otp/Loading.dart';

class EditProfile extends StatefulWidget {
  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  var userNameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    phoneController.text = userModel!.phoneNumber!.substring(
      3,
    );
    emailController.text = userModel!.emailAddress!;
    userNameController.text = userModel!.name!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FoodLayoutCubit, FoodLayoutStates>(
      listener: (context, state) {
        if (state is FoodLayoutUpdateUserDataSuccessState ||
            state is FoodLayoutGetUserDataSuccessState) {
          Get.snackbar('Food Delivery', 'Updated successfully',
              colorText: Colors.white, backgroundColor: Colors.green);
          Navigator.pop(context);
        } else if (state is FoodLayoutUpdateUserDataErrorState ||
            state is FoodLayoutGetUserDataErrorState) {
          Get.snackbar('Food Delivery', 'Update failed',
              colorText: Colors.white, backgroundColor: Colors.redAccent);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: profileContentAppBar(context: context, title: 'edit_profile'.tr),
          body: Padding(
            padding: EdgeInsets.all(Helper.getScreenWidth(context: context)*0.05),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                physics: ScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'full_name'.tr,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    textFormFieldWithHint(
                        context: context,
                        controller: userNameController,
                        borderColor: greyTextColor,
                        paddingInside: 5,
                        label: userModel!.name!,
                        type: TextInputType.text),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'phone_number'.tr,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    textFormFieldWithHint(
                        context: context,
                        controller: phoneController,
                        label: userModel!.phoneNumber!.substring(
                          3,
                        ),
                        borderColor: greyTextColor,
                        paddingInside: 5,
                        prefixWidget: const Text('+20'),
                        type: TextInputType.phone),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'email'.tr,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    textFormFieldWithHint(
                        context: context,
                        controller: emailController,
                        label: userModel!.emailAddress!,
                        borderColor: greyTextColor,
                        paddingInside: 5,
                        type: TextInputType.emailAddress),
                    const SizedBox(
                      height: 20.0,
                    ),
                    state is FoodLayoutUpdateUserDataLoadingState
                        ? Center(
                            child: CircularProgressIndicator(
                            color: mainColor,
                          ))
                        : defaultButton(
                            text: 'Save',
                            fun: () {
                              if ('+20${phoneController.text}' ==
                                  userModel!.phoneNumber) {
                                FoodLayoutCubit.get(context).updateUserData(
                                    name: userNameController.text,
                                    phoneNumber: '+20${phoneController.text}',
                                    address: userModel!.address!,
                                    emailAddress: emailController.text,
                                    context: context);
                              } else if ('+20${phoneController.text}' !=
                                  userModel!.phoneNumber) {
                                FoodLayoutCubit.get(context).updateUserData(
                                    name: userNameController.text,
                                    address: userModel!.address!,
                                    phoneNumber: '+20${phoneController.text}',
                                    emailAddress: emailController.text,
                                    context: context);
                                // navigateAndFinish(
                                //     context: context,
                                //     widget: LoadingScreen(
                                //       fromUpdate: true,
                                //         emailAddress: emailController.text,
                                //         name: userNameController.text,
                                //         phoneNumber: phoneController.text));
                              }
                            },
                            borderRadius: 5,
                            TextColor: Colors.white,
                            backgroundColor: mainColor,
                          ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
