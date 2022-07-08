import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_wallet/theme/colors.dart';
import 'package:islami_wallet/widgets/custom_icon_widget.dart';
import 'package:islami_wallet/widgets/rounded_container.dart';
import 'package:islami_wallet/widgets/text_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class SecurityPage extends StatefulWidget {
  const SecurityPage({Key? key}) : super(key: key);

  @override
  State<SecurityPage> createState() => _SecurityPageState();
}

class _SecurityPageState extends State<SecurityPage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  final TextEditingController passCode = TextEditingController();
  final TextEditingController confirmPassCode = TextEditingController();

  _resetPassCode(String value) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString('passCode', value);
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  CustomIconWidget(
                    svgName: 'ic_back',
                    // onTap: () => context.router.push(const QRScanningRoute()),
                  ),
                ],
              ),
              SizedBox(height: 4.h),
              TextWidget(
                title: 'Security',
                // title: 'Swap',
                textColor: Colors.white,
                fontSize: 19.sp,
              ),
              SizedBox(
                height: 4.h,
              ),
              RoundedContainer(
                  radius: 20,
                  width: double.infinity,
                  containerColor: AppColors.gray3,
                  padding: EdgeInsets.all(6.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TextWidget(
                        title: 'Reset Passcode',
                        textColor: Colors.white,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      TextField(
                        style: TextStyle(color: AppColors.gray, fontSize: 2.h),
                        controller: passCode,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(6)
                        ],
                        obscureText: true,
                        cursorColor: AppColors.gray,
                        decoration: InputDecoration(
                            fillColor: AppColors.primaryColor,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                  color: AppColors.darkGreen, width: 2),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                  color: AppColors.gray4, width: 1.2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              gapPadding: 0.0,
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                  color: AppColors.gray, width: 1.5),
                            ),
                            hintText: 'Enter Passcode',
                            hintStyle: TextStyle(
                                color: AppColors.gray, fontSize: 2.h)),
                      ),
                      //   ]),
                      // ),
                      SizedBox(
                        height: 2.h,
                      ),
                      TextField(
                        style: TextStyle(color: AppColors.gray, fontSize: 2.h),
                        controller: confirmPassCode,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(6)
                        ],
                        obscureText: true,
                        cursorColor: AppColors.gray,
                        decoration: InputDecoration(
                            fillColor: AppColors.primaryColor,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                  color: AppColors.darkGreen, width: 2),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                  color: AppColors.gray4, width: 1.2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              gapPadding: 0.0,
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                  color: AppColors.gray, width: 1.5),
                            ),
                            hintText: 'Confirm Passcode',
                            hintStyle: TextStyle(
                                color: AppColors.gray, fontSize: 2.h)),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Center(
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            primary: AppColors.teal,
                            side: BorderSide(
                              width: 0.2.h,
                              color: AppColors.teal,
                            ),
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            if (passCode.text == confirmPassCode.text) {
                              _resetPassCode(passCode.text);
                            }
                          },
                          child: const Text(
                            'Set New Passcode',
                            style: TextStyle(color: AppColors.teal),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                    ],
                  )),
            ],
          ),
        ),
      )),
    );
  }
}
