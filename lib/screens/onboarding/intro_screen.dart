import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami_wallet/routes/routes.dart';
import 'package:islami_wallet/theme/colors.dart';
import 'package:islami_wallet/widgets/text_widget.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/rounded_container.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  List<PageViewModel> listPagesViewModel = [];
  @override
  void initState() {
    super.initState();

    listPagesViewModel.add(PageViewModel(
      title: "Welcome to ISLAMwallet",
      body:
          "Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.",
      image: Center(
          child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.gray2,
        ),
        padding: EdgeInsets.all(15.w),
        child: Image.asset(
          'assets/gifs/onboarding1.gif',
          width: 175,
          height: 150,
        ),
      )),
      decoration: PageDecoration(
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.w800),
        bodyTextStyle: TextStyle(color: AppColors.gray, fontSize: 14.sp),
      ),
    ));

    listPagesViewModel.add(PageViewModel(
      title: "Secure and Safe",
      body:
          "Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.",
      image: Center(
          child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.gray2,
        ),
        padding: EdgeInsets.all(15.w),
        child: Image.asset(
          'assets/images/onboarding_image2.png',
          width: 175,
          height: 150,
        ),
      )),
      decoration: PageDecoration(
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.w800),
        bodyTextStyle: TextStyle(color: AppColors.gray, fontSize: 14.sp),
      ),
    ));

    listPagesViewModel.add(PageViewModel(
      title: "Islamic Sharia Compliance",
      body:
          "Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.",
      image: Center(
          child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.gray2,
        ),
        padding: EdgeInsets.all(15.w),
        child: Image.asset(
          'assets/images/onboarding_image3.png',
          width: 175,
          height: 150,
        ),
      )),
      decoration: PageDecoration(
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.w800),
        bodyTextStyle: TextStyle(color: AppColors.gray, fontSize: 14.sp),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: EdgeInsets.only(top: 8.h),
      child: Stack(
        children: [
          IntroductionScreen(
            controlsPosition: Position(left: 0, right: 0, bottom: 18.h),
            showDoneButton: false,
            showNextButton: false,
            showSkipButton: false,
            scrollPhysics: const ClampingScrollPhysics(),
            pages: listPagesViewModel,
            dotsDecorator: DotsDecorator(
                size: Size.square(2.5.w),
                activeSize: Size(5.w, 2.5.w),
                activeColor: AppColors.orangeColor,
                color: Colors.white,
                spacing: EdgeInsets.symmetric(horizontal: 2.w),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0))),
          ),
          Positioned(
              left: 5.w,
              right: 5.w,
              bottom: 8.h,
              child: RoundedContainer(
                onTap: () => context.router.push(const PasscodeRoute()),
                padding: EdgeInsets.symmetric(vertical: 1.5.h),
                radius: 50,
                border: Border.all(
                  color: AppColors.teal,
                ),
                child: Center(
                  child: TextWidget(
                    title: 'Create A New Wallet',
                    textColor: AppColors.teal,
                    fontSize: 14.sp,
                  ),
                ),
              )),
          Positioned(
              left: 0,
              right: 0,
              bottom: 2.h,
              child: Center(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => context.router.push(const HaveWalletRoute()),
                  child: TextWidget(
                    title: 'I Already Have A Wallet',
                    textColor: AppColors.teal,
                    fontSize: 14.sp,
                  ),
                ),
              )),
        ],
      ),
    )));
  }
}
