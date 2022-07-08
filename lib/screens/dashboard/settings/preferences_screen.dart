import 'package:flutter/material.dart';
import 'package:islami_wallet/theme/colors.dart';
import 'package:islami_wallet/widgets/custom_icon_widget.dart';
import 'package:islami_wallet/widgets/rounded_container.dart';
import 'package:islami_wallet/widgets/text_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:flag/flag.dart';

class PreferencesPage extends StatefulWidget {
  const PreferencesPage({Key? key}) : super(key: key);

  @override
  State<PreferencesPage> createState() => _PreferencesPageState();
}

class _PreferencesPageState extends State<PreferencesPage>
    with WidgetsBindingObserver {
  bool status = false;

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
                title: 'Preferences',
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
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const TextWidget(
                              title: 'Language',
                              textColor: Colors.white,
                            ),
                            Flag.fromCode(
                              FlagsCode.GB,
                              height: 3.h,
                              width: 3.h,
                            ),
                          ])
                    ],
                  )),
            ],
          ),
        ),
      )),
    );
  }
}
