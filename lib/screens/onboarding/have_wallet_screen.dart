import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:islami_wallet/theme/colors.dart';
import 'package:islami_wallet/widgets/custom_icon_widget.dart';
import 'package:islami_wallet/widgets/rounded_container.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:sizer/sizer.dart';
import '../../routes/routes.dart';
import '../../widgets/text_widget.dart';

class HaveWalletPage extends StatefulWidget {
  const HaveWalletPage({Key? key}) : super(key: key);

  @override
  State<HaveWalletPage> createState() => _HaveWalletPageState();
}

class _HaveWalletPageState extends State<HaveWalletPage> {
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomIconWidget(svgName: 'ic_back'),
              SizedBox(
                height: 4.h,
              ),
              Center(
                child: TextWidget(
                  title: 'Import Wallet',
                  fontSize: 18.sp,
                  textColor: Colors.white,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              const Center(
                child: TextWidget(
                  title:
                      'Enter the 12 recovery phrase your were given when you created your account',
                ),
              ),
              SizedBox(
                height: 6.h,
              ),
              RoundedContainer(
                containerColor: AppColors.gray3,
                border: Border.all(color: AppColors.gray4),
                width: double.infinity,
                radius: 15,
                padding: EdgeInsets.all(4.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextWidget(
                      title: 'Recovery Phrase',
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        TextWidget(
                          title: 'Paste',
                          textColor: AppColors.teal,
                          fontSize: 16.sp,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              Center(
                child: TextWidget(
                  title: 'Or scan the QR code',
                  textColor: AppColors.teal,
                  fontSize: 16.sp,
                ),
              ),
              NumericKeyboard(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                onKeyboardTap: _onKeyboardTap,
                textColor: Colors.white,
                rightButtonFn: () {
                  if (text.isNotEmpty) {
                    setState(() {
                      text = text.substring(0, text.length - 1);
                    });
                    log('after delete text $text');
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
              SizedBox(
                height: 2.h,
              ),
              RoundedContainer(
                onTap: () => context.router.push(const BottomNavigationRoute()),
                padding: EdgeInsets.symmetric(vertical: 1.5.h),
                radius: 50,
                border: Border.all(
                  color: AppColors.teal,
                ),
                child: Center(
                  child: TextWidget(
                    title: 'Import Wallet',
                    textColor: AppColors.teal,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
