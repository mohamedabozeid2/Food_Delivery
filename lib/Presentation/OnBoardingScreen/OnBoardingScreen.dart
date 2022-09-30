import 'package:flutter/material.dart';
import 'package:food_delivery/Presentation/LoginScreen/LoginScreen.dart';
import 'package:food_delivery/Shared/Components/Components.dart';
import 'package:food_delivery/Shared/styles/Themes.dart';
import 'package:food_delivery/core/utils/helper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../DataModels/BoadingModel.dart';
import '../../Shared/Network/Local/CacheHelper.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController boardingController = PageController();

  bool isLast = false;

  List<BoardingModel> boardingList = [
    BoardingModel(
        title: 'Find Food You Love',
        body:
        'Discover the best foods from over 1,000 restaurants and fast delivery',
        image: 'assets/images/splash2.png'),
    BoardingModel(
        title: 'Free Delivery',
        body: 'Find your nearby food places and your favorite foods.',
        image: 'assets/images/splash3.png'),
    BoardingModel(
        title: 'Free Delivery',
        body: 'Find your nearby food places and your favorite foods.',
        image: 'assets/images/splash4.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
         EdgeInsets.only(top: Helper.getScreenWidth(context: context)*0.11, bottom: Helper.getScreenWidth(context: context)*0.11, left: Helper.getScreenWidth(context: context)*0.05, right: Helper.getScreenWidth(context: context)*0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(Helper.getScreenWidth(context: context)*0.05),
                        child: Text(
                          'Skip',
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(
                              color: Color(0xff1D2126), fontSize: 18.0),
                        ),
                      )),
                  onTap: () {
                    navigateAndFinish(
                        context: context, widget: LoginScreen());
                    CacheHelper.saveData(key: 'onBoarding', value: true);
                  },
                )
              ],
            ),
            Expanded(
                child: PageView.builder(
                    controller: boardingController,
                    physics: const BouncingScrollPhysics(),
                    itemCount: boardingList.length,
                    onPageChanged: (value) {
                      if (value == boardingList.length - 1) {
                        setState(() {
                          isLast = true;
                        });
                      } else {
                        setState(() {
                          isLast = false;
                        });
                      }
                    },
                    itemBuilder: (context, index) {
                      return buildBoardingItem(
                          context: context,
                          title: boardingList[index].title,
                          body: boardingList[index].body,
                          image: boardingList[index].image);
                    })),
            SmoothPageIndicator(
              controller: boardingController,
              count: boardingList.length,

              effect: ExpandingDotsEffect(
                activeDotColor: mainColor,
                dotWidth: 15,
                dotHeight: 10,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(Helper.getScreenWidth(context: context)*0.025),
              child: defaultButton(text: 'Next',
                  fun: () {
                    if (isLast == true) {
                      navigateAndFinish(
                          context: context, widget: LoginScreen());
                      CacheHelper.saveData(key: 'onBoarding', value: true);

                    } else {
                      boardingController.nextPage(
                          duration: const Duration(milliseconds: 950),
                          curve: Curves.fastOutSlowIn);
                    }
                  },
                  backgroundColor: mainColor,
                  borderRadius: 5,

                  TextColor: Colors.white,
                  height: 50
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem({
    required BuildContext context,
    required String title,
    required String body,
    required String image,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding:
           EdgeInsets.only(top: Helper.getScreenWidth(context: context)*0.1, right: Helper.getScreenWidth(context: context)*0.025, left: Helper.getScreenWidth(context: context)*0.025, bottom: Helper.getScreenWidth(context: context)*0.025),
          child: Text(
            textAlign: TextAlign.center,
            title,
            style: Theme
                .of(context)
                .textTheme
                .bodyText2,
          ),
        ),
        Padding(
          padding:  EdgeInsets.symmetric(vertical: Helper.getScreenWidth(context: context)*0.052, horizontal: Helper.getScreenWidth(context: context)*0.04),
          child: Text(
            textAlign: TextAlign.center,
            body,
            style: Theme
                .of(context)
                .textTheme
                .subtitle2,
          ),
        ),
        Image(
          image: AssetImage(image),
          height: Helper.getScreenHeight(context: context) * 0.45,
          width: Helper.getScreenWidth(context: context) * 0.9,
        )
      ],
    );
  }
}
