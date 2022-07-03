import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_wallet/routes/routes.dart';
import 'package:islami_wallet/widgets/custom_icon_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:trust_wallet_core/flutter_trust_wallet_core.dart';

import '../../../theme/colors.dart';
import '../../../widgets/rounded_container.dart';
import '../../../widgets/text_widget.dart';

class RecoveryPhrasePage extends StatefulWidget {
  const RecoveryPhrasePage({Key? key}) : super(key: key);

  @override
  State<RecoveryPhrasePage> createState() => _RecoveryPhrasePageState();
}

class _RecoveryPhrasePageState extends State<RecoveryPhrasePage> {
  bool isPhraseVisible = false;
  var correctPhrase = [
    // 'then',
    // 'vacant',
    // 'girl',
    // 'exist',
    // 'avoid',
    // 'usage',
    // 'ride',
    // 'alien',
    // 'comic',
    // 'cross',
    // 'upon',
    // 'hub'
  ];

  late HDWallet wallet;

  @override
  void initState() {
    super.initState();
    String mnemonic = "";
    // "rent craft script crucial item someone dream federal notice page shrug pipe young hover duty"; // 有测试币的 tron地址
    // wallet = HDWallet.createWithMnemonic(mnemonic);
    wallet = HDWallet();
    mnemonic = wallet.mnemonic();
    correctPhrase = mnemonic.split(' ');
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
                  title: 'Account Recovery Phrase',
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
                      'Select each word in the order it was presented to you',
                ),
              ),
              SizedBox(
                height: 6.h,
              ),
              RoundedContainer(
                onTap: () => setState(() => isPhraseVisible = true),
                containerColor: AppColors.gray3,
                border: !isPhraseVisible
                    ? Border.all(color: AppColors.gray4)
                    : null,
                width: double.infinity,
                radius: 20,
                padding: EdgeInsets.all(4.w),
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 1.h),
                      child: GridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 3,
                        crossAxisSpacing: 2.h,
                        childAspectRatio: 0.5.w,
                        mainAxisSpacing: 2.h,
                        shrinkWrap: true,
                        children: List.generate(12, (index) {
                          return RoundedContainer(
                            containerColor: AppColors.primaryColor,
                            radius: 15,
                            child: Center(
                              child: TextWidget(
                                title: '${index + 1}. ${correctPhrase[index]} ',
                                textColor: Colors.white,
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    if (!isPhraseVisible)
                      Positioned.fill(
                          child: RoundedContainer(
                        child: ClipRRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 5,
                              sigmaY: 5,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                    'assets/svg/ic_not_visible.svg'),
                                SizedBox(
                                  height: 4.h,
                                ),
                                TextWidget(
                                  title: 'Tap to reveal your seed phrase',
                                  textColor: Colors.white,
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                TextWidget(
                                  title:
                                      'Make sure no one is watching your screen.',
                                  textColor: Colors.white,
                                  fontSize: 12.sp,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )),
                  ],
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              InkWell(
                onTap: () async {
                  await Clipboard.setData(
                      ClipboardData(text: wallet.mnemonic()));

                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('✓   Copied to Clipboard')));
                },
                child: Center(
                    child: TextWidget(
                  title: 'Copy phrase',
                  textColor: AppColors.teal,
                  fontSize: 16.sp,
                )),
              ),
              SizedBox(
                height: 4.h,
              ),
              RoundedContainer(
                radius: 20,
                padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
                containerColor: AppColors.tomato,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        // Note: Styles for TextSpans must be explicitly defined.
                        // Child text spans will inherit styles from parent
                        style: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'DO NOT ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 16.sp)),
                          TextSpan(
                            text: 'share your recovery phrase!',
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    const TextWidget(
                      textColor: Colors.white,
                      textAlign: TextAlign.center,
                      title:
                          'If someone has your recovery phrase, they will have full control of your wallet.',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              RoundedContainer(
                onTap: () => context.router
                    .push(VerifyRecoveryRoute(mnemonic: wallet.mnemonic())),
                padding: EdgeInsets.symmetric(vertical: 1.5.h),
                radius: 50,
                border: Border.all(
                  color: AppColors.teal,
                ),
                child: Center(
                  child: TextWidget(
                    title: 'Continue',
                    textColor: AppColors.teal,
                    fontSize: 14.sp,
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
