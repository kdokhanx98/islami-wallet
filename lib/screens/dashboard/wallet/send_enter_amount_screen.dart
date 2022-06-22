import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_wallet/widgets/custom_icon_widget.dart';
import 'package:islami_wallet/widgets/text_widget.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:sizer/sizer.dart';

import '../../../theme/colors.dart';
import '../../../widgets/rounded_container.dart';

class SendEnterAmountPage extends StatefulWidget {
  const SendEnterAmountPage({Key? key}) : super(key: key);

  @override
  State<SendEnterAmountPage> createState() => _SendEnterAmountPageState();
}

class _SendEnterAmountPageState extends State<SendEnterAmountPage> {
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
          child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomIconWidget(svgName: 'ic_back'),
                  SizedBox(
                    height: 4.h,
                  ),
                  RoundedContainer(
                      radius: 30,
                      width: double.infinity,
                      containerColor: AppColors.gray3,
                      border: Border.all(color: AppColors.gray4),
                      padding: EdgeInsets.all(6.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                              onTap: () {},
                              child: SvgPicture.asset('assets/svg/ic_max.svg')),
                          Column(
                            children: [
                              TextWidget(
                                title: '0 ISLAMI',
                                fontWeight: FontWeight.bold,
                                fontSize: 18.sp,
                                textColor: AppColors.gray7,
                              ),
                              SizedBox(
                                height: 0.5.h,
                              ),
                              const TextWidget(title: '\$ 0.00'),
                            ],
                          ),
                          GestureDetector(
                              onTap: () {},
                              child:
                                  SvgPicture.asset('assets/svg/ic_change.svg')),
                        ],
                      )),
                  SizedBox(
                    height: 10.h,
                  ),
                  const Center(child: TextWidget(title: 'My Balance')),
                  SizedBox(
                    height: 1.h,
                  ),
                  RoundedContainer(
                      radius: 30,
                      width: double.infinity,
                      containerColor: AppColors.gray3,
                      padding:
                          EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              RoundedContainer(
                                  width: 30,
                                  height: 30,
                                  containerColor: AppColors.orange,
                                  child: Padding(
                                    padding: EdgeInsets.all(1.w),
                                    child: SvgPicture.asset(
                                      'assets/svg/ic_islami.svg',
                                    ),
                                  )),
                              SizedBox(
                                width: 4.w,
                              ),
                              const TextWidget(
                                title: 'IslamiCoin',
                                textColor: Colors.white,
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const TextWidget(
                                title: '12060 ISLAMI',
                                textColor: Colors.white,
                                fontWeight: FontWeight.bold,
                                textAlign: TextAlign.end,
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              const TextWidget(
                                title: '\$28.17216',
                                textAlign: TextAlign.end,
                              )
                            ],
                          ),
                        ],
                      )),
                  NumericKeyboard(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    onKeyboardTap: _onKeyboardTap,
                    textColor: Colors.white,
                    rightButtonFn: () {
                      if (text.isNotEmpty) {
                        setState(() {
                          text = text.substring(0, text.length - 1);
                        });
                        log('after delete text ');
                      }
                    },
                    rightIcon: const Icon(
                      Icons.backspace_outlined,
                      color: Colors.white,
                    ),
                    leftButtonFn: () {
                      log('left button clicked');
                    },
                    leftIcon: Icon(
                      Icons.circle,
                      size: 1.w,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  RoundedContainer(
                    onTap: () {},
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
            ),
          ),
        ],
      )),
    );
  }
}
