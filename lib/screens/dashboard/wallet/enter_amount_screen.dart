import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_wallet/theme/colors.dart';
import 'package:islami_wallet/widgets/custom_icon_widget.dart';
import 'package:islami_wallet/widgets/rounded_container.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:sizer/sizer.dart';

import '../../../widgets/text_widget.dart';

class EnterAmountPage extends StatefulWidget {
  const EnterAmountPage({Key? key}) : super(key: key);

  @override
  State<EnterAmountPage> createState() => _EnterAmountPageState();
}

class _EnterAmountPageState extends State<EnterAmountPage> {
  String amount = '0';

  _onKeyboardTap(String value) {
    setState(() {
      if (amount == '0') {
        amount = value;
      } else {
        amount = amount + value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CustomIconWidget(svgName: 'ic_back'),
                SizedBox(
                  width: 18.w,
                ),
                Center(
                  child: TextWidget(
                    title: 'Enter Amount',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 4.h,
            ),
            RoundedContainer(
              radius: 20,
              containerColor: AppColors.gray3,
              padding: EdgeInsets.all(6.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 50.w,
                        child: TextWidget(
                          title: amount,
                          textAlign: TextAlign.start,
                          fontSize: 20.sp,
                          maxLines: 1,
                        ),
                      ),
                      TextWidget(
                        title: 'ISLAMI',
                        textColor: Colors.white,
                        fontSize: 20.sp,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  const TextWidget(
                    title: '\$ 0.00',
                    textColor: AppColors.gray7,
                  )
                ],
              ),
            ),
            const Spacer(),
            NumericKeyboard(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              onKeyboardTap: _onKeyboardTap,
              textColor: Colors.white,
              rightButtonFn: () {
                if (amount.isNotEmpty && amount != '0') {
                  setState(() {
                    amount = amount.substring(0, amount.length - 1);
                    if (amount.isEmpty) {
                      amount = '0';
                    }
                  });
                }
              },
              rightIcon: const Icon(
                Icons.backspace_outlined,
                color: Colors.white,
              ),
              leftButtonFn: () {
                if (amount.isNotEmpty) {
                  setState(() {
                    amount = '$amount.';
                  });
                }
              },
              leftIcon: Icon(
                Icons.circle,
                size: 1.w,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            RoundedContainer(
              onTap: () {
                showModalBottomSheet<String>(
                    isScrollControlled: true,
                    useRootNavigator: true,
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (BuildContext context) {
                      return sendLinkMethod();
                    });
              },
              padding: EdgeInsets.symmetric(vertical: 1.5.h),
              radius: 50,
              border: Border.all(
                color: AppColors.teal,
              ),
              child: Center(
                child: TextWidget(
                  title: 'Next',
                  textColor: AppColors.teal,
                  fontSize: 14.sp,
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }

  StatefulBuilder sendLinkMethod() {
    return StatefulBuilder(
      builder: (BuildContext context,
          StateSetter setState /*You can rename this!*/) {
        return Container(
          decoration: const BoxDecoration(
              color: AppColors.gray3,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: 1.h,
                  ),
                  RoundedContainer(
                    width: 12.w,
                    height: 1.w,
                    containerColor: AppColors.gray5,
                    radius: 20,
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  SvgPicture.asset('assets/svg/ic_send_link.svg'),
                  SizedBox(
                    height: 3.h,
                  ),
                  TextWidget(
                    title: 'Send Link',
                    textColor: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 18.sp,
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  const TextWidget(
                    title: 'Your request link is ready to send!',
                    textColor: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  SizedBox(
                    width: 75.w,
                    child: const TextWidget(
                        title:
                            'Send the below link to a friend, and it will ask them to send 1289 ISLAMI'),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  SizedBox(
                    width: 70.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RoundedContainer(
                          onTap: () {
                            // copy the wallet.
                            log('walled was copied');
                          },
                          radius: 50,
                          containerColor: AppColors.primaryColor,
                          padding: EdgeInsets.symmetric(
                              vertical: 2.w, horizontal: 2.w),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const TextWidget(
                                title: 'https://islami…24jq',
                                textColor: Colors.white,
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              SvgPicture.asset(
                                'assets/svg/ic_copy.svg',
                                height: 3.5.h,
                              )
                            ],
                          ),
                        ),
                        SvgPicture.asset('assets/svg/ic_rounded_scan.svg')
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  RoundedContainer(
                    onTap: () {
                      context.router
                          .popUntilRouteWithName('BottomNavigationRoute');
                    },
                    padding: EdgeInsets.symmetric(vertical: 1.5.h),
                    radius: 50,
                    border: Border.all(
                      color: AppColors.teal,
                    ),
                    child: Center(
                      child: TextWidget(
                        title: 'Send Link',
                        textColor: AppColors.teal,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
