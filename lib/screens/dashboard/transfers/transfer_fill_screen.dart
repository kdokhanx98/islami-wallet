import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_wallet/widgets/text_widget.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:sizer/sizer.dart';

import '../../../theme/colors.dart';
import '../../../widgets/custom_icon_widget.dart';
import '../../../widgets/rounded_container.dart';

class TranferFillPage extends StatefulWidget {
  const TranferFillPage({Key? key}) : super(key: key);

  @override
  State<TranferFillPage> createState() => _TranferFillPageState();
}

class _TranferFillPageState extends State<TranferFillPage> {
  String text = '';

  _onKeyboardTap(String value) {
    setState(() {
      text = text + value;
    });
    log('text $text');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    const CustomIconWidget(
                      borderColor: AppColors.gray7,
                      svgName: 'ic_close',
                    ),
                    SizedBox(
                      width: 28.w,
                    ),
                    Center(
                      child: TextWidget(
                        title: 'Swap',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        textColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              RoundedContainer(
                width: double.infinity,
                containerColor: AppColors.gray3,
                radius: 20,
                padding: EdgeInsets.all(4.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextWidget(
                      title: 'From',
                      textColor: Colors.white,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    RoundedContainer(
                      width: double.infinity,
                      containerColor: AppColors.primaryColor,
                      padding: EdgeInsets.all(4.w),
                      radius: 20,
                      border: Border.all(color: AppColors.gray4),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                RoundedContainer(
                                    width: 20,
                                    height: 20,
                                    containerColor: AppColors.darkGreen2,
                                    child: Padding(
                                      padding: EdgeInsets.all(1.w),
                                      child: SvgPicture.asset(
                                        'assets/svg/ic_caizcoin.svg',
                                        width: 13,
                                        height: 12,
                                      ),
                                    )),
                                SizedBox(
                                  width: 2.w,
                                ),
                                const TextWidget(
                                  title: 'CAZ',
                                  textColor: Colors.white,
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Colors.white,
                                  size: 15,
                                ),
                              ],
                            ),
                            const TextWidget(
                              title: '12',
                              textColor: Colors.white,
                            ),
                          ]),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        SvgPicture.asset('assets/svg/ic_transfer.svg'),
                        SizedBox(
                          width: 8.w,
                        ),
                      ],
                    ),
                    const TextWidget(
                      title: 'To',
                      textColor: Colors.white,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    RoundedContainer(
                      width: double.infinity,
                      containerColor: AppColors.primaryColor,
                      padding: EdgeInsets.all(4.w),
                      radius: 20,
                      border: Border.all(color: AppColors.gray4),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                RoundedContainer(
                                    width: 20,
                                    height: 20,
                                    containerColor: AppColors.orange,
                                    child: Padding(
                                      padding: EdgeInsets.all(1.w),
                                      child: SvgPicture.asset(
                                        'assets/svg/ic_islami.svg',
                                        width: 13,
                                        height: 12,
                                      ),
                                    )),
                                SizedBox(
                                  width: 2.w,
                                ),
                                const TextWidget(
                                  title: 'ISLAMI',
                                  textColor: Colors.white,
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Colors.white,
                                  size: 15,
                                ),
                              ],
                            ),
                            const TextWidget(
                              title: '14210.448',
                              textColor: Colors.white,
                            ),
                          ]),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    const Center(
                        child: TextWidget(title: '1 CAZ = 1184.204 ISLAMI')),
                  ],
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RoundedContainer(
                    width: 20.w,
                    containerColor: AppColors.gray3,
                    padding: EdgeInsets.symmetric(vertical: 1.5.h),
                    child: const TextWidget(
                      title: '25%',
                      textColor: AppColors.teal,
                    ),
                  ),
                  RoundedContainer(
                    width: 20.w,
                    containerColor: AppColors.gray3,
                    padding: EdgeInsets.symmetric(vertical: 1.5.h),
                    child: const TextWidget(
                      title: '50%',
                      textColor: AppColors.teal,
                    ),
                  ),
                  RoundedContainer(
                    width: 20.w,
                    containerColor: AppColors.gray3,
                    padding: EdgeInsets.symmetric(vertical: 1.5.h),
                    child: const TextWidget(
                      title: '75%',
                      textColor: AppColors.teal,
                    ),
                  ),
                  RoundedContainer(
                    width: 20.w,
                    containerColor: AppColors.gray3,
                    padding: EdgeInsets.symmetric(vertical: 1.5.h),
                    child: const TextWidget(
                      title: '100%',
                      textColor: AppColors.teal,
                    ),
                  ),
                ],
              ),
              NumericKeyboard(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                onKeyboardTap: _onKeyboardTap,
                textColor: Colors.white,
                rightButtonFn: () {},
                rightIcon: const Icon(
                  Icons.backspace_outlined,
                  color: Colors.white,
                ),
                leftButtonFn: () {
                  log('left button clicked');
                },
                leftIcon: const Icon(
                  Icons.check,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              RoundedContainer(
                onTap: () {
                  context.router.pop();
                },
                padding: EdgeInsets.symmetric(vertical: 1.5.h),
                radius: 50,
                border: Border.all(
                  color: AppColors.teal,
                ),
                child: Center(
                  child: TextWidget(
                    title: 'Swap',
                    textColor: AppColors.teal,
                    fontSize: 14.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 3.h,
              )
            ],
          ),
        ),
      )),
    );
  }
}
