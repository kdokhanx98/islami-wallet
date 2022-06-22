import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
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
              leftIcon: const Icon(
                Icons.circle,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            RoundedContainer(
              onTap: () => context.router.pop().then((value) => null),
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
}
