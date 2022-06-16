import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:islami_wallet/routes/routes.dart';
import 'package:islami_wallet/widgets/custom_pages_back.dart';
import 'package:islami_wallet/widgets/rounded_container.dart';
import 'package:sizer/sizer.dart';

import '../../../theme/colors.dart';
import '../../../widgets/text_widget.dart';

class CreateNewWalletPage extends StatefulWidget {
  const CreateNewWalletPage({Key? key}) : super(key: key);

  @override
  State<CreateNewWalletPage> createState() => _CreateNewWalletPageState();
}

class _CreateNewWalletPageState extends State<CreateNewWalletPage> {
  bool isChecked = false;

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
            const CustomPagesBack(),
            SizedBox(
              height: 4.h,
            ),
            Center(
                child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.gray2,
              ),
              padding: EdgeInsets.all(15.w),
              child: Image.asset(
                'assets/images/create_wallet_fingerprint.png',
                width: 175,
                height: 150,
              ),
            )),
            SizedBox(
              height: 4.h,
            ),
            Center(
              child: TextWidget(
                title: 'Secure Your Wallet',
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
                    'In the next step you will see an account recovery phrase. This phrase is the only way you can recover access to your account if your phone is lost or stolen.',
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            Center(
              child: TextWidget(
                title: 'Why is it important?',
                textColor: AppColors.tale,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            RoundedContainer(
              radius: 20,
              padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
              containerColor: AppColors.tomato,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 0.4.h),
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        setState(() {
                          isChecked = !isChecked;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 100),
                        decoration: BoxDecoration(
                          color: isChecked ? Colors.white : Colors.transparent,
                          border: Border.all(color: Colors.white, width: 0.4.w),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: isChecked
                              ? Icon(
                                  Icons.check,
                                  color: AppColors.tomato,
                                  size: 6.5.w,
                                )
                              : SizedBox(
                                  width: 6.5.w,
                                  height: 6.5.w,
                                ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  const Flexible(
                    child: TextWidget(
                        textColor: Colors.white,
                        textAlign: TextAlign.start,
                        title:
                            'I understand that if I lose my recovery phrase, I will not be able to access my account'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            RoundedContainer(
              isEnabled: isChecked,
              onTap: () => context.router.push(const RecoveryPhraseRoute()),
              padding: EdgeInsets.symmetric(vertical: 1.5.h),
              radius: 50,
              border: Border.all(
                color: isChecked ? AppColors.tale : AppColors.gray,
              ),
              child: Center(
                child: TextWidget(
                  title: 'Get Started',
                  textColor: isChecked ? AppColors.tale : AppColors.gray,
                  fontSize: 14.sp,
                ),
              ),
            )
          ],
        ),
      ))),
    );
  }
}
