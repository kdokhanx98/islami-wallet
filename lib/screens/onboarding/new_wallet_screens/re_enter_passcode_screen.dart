import 'dart:developer';
import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:islami_wallet/routes/routes.dart';
import 'package:islami_wallet/theme/colors.dart';
import 'package:islami_wallet/widgets/custom_icon_widget.dart';
import 'package:islami_wallet/widgets/pin.dart';
import 'package:islami_wallet/widgets/rounded_container.dart';
import 'package:local_auth/local_auth.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import '../../../widgets/text_widget.dart';

class ReenterPasscodePage extends StatefulWidget {
  const ReenterPasscodePage({Key? key}) : super(key: key);

  @override
  State<ReenterPasscodePage> createState() => _ReenterPasscodePageState();
}

class _ReenterPasscodePageState extends State<ReenterPasscodePage> {
  String text = '';
  final LocalAuthentication auth = LocalAuthentication();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  _onKeyboardTap(String value) async {
    final SharedPreferences prefs = await _prefs;
    String? passCode = prefs.getString('passCode');
    if (text.length < 6) {
      setState(() {
        text = text + value;
      });
      if (text == passCode) {
        final bool canAuthenticateWithBiometrics =
            await auth.canCheckBiometrics;
        final bool canAuthenticate =
            canAuthenticateWithBiometrics || await auth.isDeviceSupported();
        final List<BiometricType> availableBiometrics =
            await auth.getAvailableBiometrics();
        if (canAuthenticate && availableBiometrics.isNotEmpty) {
          final result = await showModalBottomSheet<String>(
              backgroundColor: Colors.transparent,
              context: context,
              builder: (BuildContext context) {
                return Container(
                  decoration: const BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
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
                          height: 4.h,
                        ),
                        if (Platform.isAndroid) ...[
                          Image.asset(
                            'assets/images/create_wallet_fingerprint.png',
                            width: 20.w,
                            height: 20.w,
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Center(
                            child: TextWidget(
                              title: 'Secure your Wallet',
                              fontSize: 18.sp,
                              textColor: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          // RoundedContainer(
                          //   onTap: () async {
                          //     await auth.authenticate(
                          //         localizedReason:
                          //             'Please authenticate to show account balance',
                          //         options: const AuthenticationOptions(
                          //             biometricOnly: true));
                          //     context.router.pop('enable');
                          //   },
                          //   padding: EdgeInsets.symmetric(vertical: 1.5.h),
                          //   radius: 50,
                          //   border: Border.all(
                          //     color: AppColors.teal,
                          //   ),
                          //   child: Center(
                          //     child: TextWidget(
                          //       title: 'Enable',
                          //       textColor: AppColors.teal,
                          //       fontSize: 14.sp,
                          //     ),
                          //   ),
                          // ),
                        ] else if (availableBiometrics
                                .contains(BiometricType.weak) ||
                            availableBiometrics
                                .contains(BiometricType.face)) ...[
                          Image.asset(
                            'assets/images/face_id.png',
                            width: 20.w,
                            height: 20.w,
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Center(
                            child: TextWidget(
                              title: 'Log in with face ID',
                              fontSize: 18.sp,
                              textColor: Colors.white,
                            ),
                          ),
                        ] else if (availableBiometrics
                                .contains(BiometricType.strong) ||
                            availableBiometrics
                                .contains(BiometricType.fingerprint)) ...[
                          Image.asset(
                            'assets/images/touch_id.png',
                            width: 20.w,
                            height: 20.w,
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Center(
                            child: TextWidget(
                              title: 'Log in with touch ID',
                              fontSize: 18.sp,
                              textColor: Colors.white,
                            ),
                          ),
                        ],
                        SizedBox(
                          height: 2.h,
                        ),
                        const Center(
                          child: TextWidget(
                            title:
                                'User your biometric to add an extra layer of security and easier way to access your wallet',
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        RoundedContainer(
                          onTap: () async {
                            await auth.authenticate(
                                localizedReason:
                                    'Please authenticate to show account balance',
                                options: const AuthenticationOptions(
                                    biometricOnly: true));
                            context.router.pop('enable');
                          },
                          padding: EdgeInsets.symmetric(vertical: 1.5.h),
                          radius: 50,
                          border: Border.all(
                            color: AppColors.teal,
                          ),
                          child: Center(
                            child: TextWidget(
                              title: 'Enable',
                              textColor: AppColors.teal,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Center(
                          child: GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              // do it later
                              context.router.pop();
                            },
                            child: TextWidget(
                              title: 'Do It Later',
                              textColor: AppColors.teal,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                      ],
                    ),
                  ),
                );
              });
          if (result == 'enable') {
            // this means user enabled biometrics -> enable it
            log('enabled');
          } else {
            // this means user did not enable biometrics -> do nothing
            log('not enabled');
          }
        }
        context.router.push(const CreateNewWalletRoute());
      }
      if (text.length == 6 && text != passCode) {
        falsePasscode();
        Future.delayed(const Duration(seconds: 3), () {
          setState(() {
            text = '';
          });
        });
      }
    }
  }

  void falsePasscode() {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Wrong Passcode')));
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
                title: 'Re-enter your Passcode',
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
