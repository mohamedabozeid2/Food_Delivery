import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/Presentation/FoodLayoutScreen/Cubit/FoodLayoutCubit.dart';
import 'package:food_delivery/Presentation/FoodLayoutScreen/Cubit/FoodLayoutStates.dart';
import 'package:food_delivery/Presentation/ProfileScreen/ProfileContentScreens/AboutUsScreen.dart';
import 'package:food_delivery/Presentation/ProfileScreen/ProfileContentScreens/EditProfile.dart';
import 'package:food_delivery/Presentation/ProfileScreen/ProfileContentScreens/InviteScreen.dart';
import 'package:food_delivery/Presentation/ProfileScreen/ProfileContentScreens/LanguageScreen.dart';
import 'package:food_delivery/Presentation/ProfileScreen/ProfileContentScreens/MyAddressScreen.dart';
import 'package:food_delivery/Presentation/ProfileScreen/ProfileContentScreens/Payment%20Screen.dart';
import 'package:food_delivery/Presentation/ProfileScreen/Widgets/SettingsItemBuilder.dart';
import 'package:food_delivery/Shared/Components/Components.dart';
import 'package:food_delivery/Shared/Constants/Constants.dart';
import 'package:food_delivery/Shared/styles/Themes.dart';
import 'package:food_delivery/core/utils/helper.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FoodLayoutCubit, FoodLayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return SingleChildScrollView(
          child: SizedBox(
              width: Helper.getScreenWidth(context: context) * 0.95,
              child: Padding(
                padding: EdgeInsets.all(Helper.getScreenWidth(context: context)*0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    GestureDetector(
                      onTap: (){
                        navigateTo(context, EditProfile());
                      },
                      child: Container(
                        color: Colors.transparent,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userModel!.name!.isEmpty ? 'User Name' : userModel!.name!,
                              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                color: mainColor,
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: [
                                Text(
                                  userModel!.phoneNumber!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(fontSize: 16.0),
                                ),
                                const Spacer(),
                                Text(
                                  'edit'.tr,
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(fontSize: 16.0),
                                ),
                              ],
                            ),
                            Text(
                              userModel!.emailAddress!.isNotEmpty
                                  ? userModel!.emailAddress!
                                  : "No Email",
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(fontSize: 14.0),
                            ),
                          ],
                        ),
                      ),
                    ),

                    myDivider(color: greyTextColor, paddingVertical: Helper.getScreenWidth(context: context)*0.05),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: Helper.getScreenWidth(context: context)*0.025),
                      child: settingsItemBuilder(
                          icon: Icons.credit_card,
                          text: 'payment_method'.tr,
                          screen: PaymentScreen(),
                          context: context),
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(vertical: Helper.getScreenWidth(context: context)*0.025),
                      child: settingsItemBuilder(
                          icon: Icons.location_on,
                          text: 'my_address'.tr,
                          screen: MyAddressScreen(),
                          context: context),
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(vertical: Helper.getScreenWidth(context: context)*0.025),
                      child: settingsItemBuilder(
                          icon: Icons.language,
                          text: 'change_language'.tr,
                          screen: ChangeLanguageScreen(),
                          context: context),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: Helper.getScreenWidth(context: context)*0.025),
                      child: settingsItemBuilder(
                          icon: Icons.info_outline,
                          text: 'about_us'.tr,
                          screen: AboutUsScreen(),
                          context: context),
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(vertical: Helper.getScreenWidth(context: context)*0.025),
                      child: settingsItemBuilder(
                          icon: Icons.share,
                          text: 'invite_and_share'.tr,
                          screen: InviteScreen(),
                          context: context),
                    )
                  ],
                ),
              )),
        );
      },
    );
  }
}
