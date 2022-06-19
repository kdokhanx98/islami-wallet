import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:islami_wallet/widgets/custom_icon_widget.dart';
import 'package:islami_wallet/widgets/pin.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:sizer/sizer.dart';

import '../../../routes/routes.dart';
import '../../../widgets/text_widget.dart';

class PasscodePage extends StatefulWidget {
  const PasscodePage({Key? key}) : super(key: key);

  @override
  State<PasscodePage> createState() => _PasscodePageState();
}

class _PasscodePageState extends State<PasscodePage> {
  String text = '';

  _onKeyboardTap(String value) async {
    if (text.length < 6) {
      setState(() {
        text = text + value;
      });
      if (text.length == 6) {
        final result = await context.router.push(const ReenterPasscodeRoute());
        if (result == null) {
          setState(() {
            text = '';
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomIconWidget(svgName: 'ic_back'),
            SizedBox(
              height: 4.h,
            ),
            Center(
              child: TextWidget(
                title: 'Create your Passcode',
                fontSize: 18.sp,
                textColor: Colors.white,
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            const Center(
              child: TextWidget(
                title: 'Lock your wallet on this device',
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            PinWidget(
              text: text,
            ),
            const Spacer(),
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
            ),
          ],
        ),
      )),
    );
  }
}
