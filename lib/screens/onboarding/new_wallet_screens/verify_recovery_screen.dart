import 'package:auto_route/auto_route.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_wallet/routes/routes.dart';
import 'package:islami_wallet/services/configuration_service.dart';
import 'package:islami_wallet/widgets/custom_icon_widget.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../theme/colors.dart';
import '../../../widgets/rounded_container.dart';
import '../../../widgets/text_widget.dart';

class VerifyRecoveryPage extends StatefulWidget {
  final String mnemonic;
  const VerifyRecoveryPage({Key? key, required this.mnemonic})
      : super(key: key);

  @override
  State<VerifyRecoveryPage> createState() => _VerifyRecoveryPageState();
}

class _VerifyRecoveryPageState extends State<VerifyRecoveryPage> {
  var list = List<int>.generate(11, (int index) => index + 1);
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
  var shuffledPhrase = [
    // 'alien',
    // 'usage',
    // 'cross',
    // 'upon',
    // 'hub',
    // 'vacant',
    // 'ride',
    // 'then',
    // 'comic',
    // 'girl',
    // 'exist',
    // 'avoid'
  ];
  var falseWords = [];
  int count = 0;
  int firstClickedIndex = -1;
  int secondCLickedIndex = -1;
  int thirdClickedIndex = -1;
  bool isFirstFilled = false;
  bool isSecondFilled = false;
  bool isThirdFilled = false;

  var correctList = [false, false, false];

  @override
  void initState() {
    list.shuffle();
    super.initState();
    correctPhrase = widget.mnemonic.split(' ');
    shuffledPhrase = correctPhrase.toList();
    shuffledPhrase.shuffle();
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
                  Center(
                    child: TextWidget(
                      title: 'Verify Your Recovery Phrase',
                      fontSize: 18.sp,
                      textColor: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
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
                        TextWidget(
                          title:
                              'Tap each word in the order it was presented to you',
                          textColor: Colors.white,
                          textAlign: TextAlign.start,
                          fontSize: 15.sp,
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: List.generate(
                            3,
                            (index) {
                              if ((isFirstFilled && index + 1 == 1) ||
                                  (isSecondFilled && index + 1 == 2) ||
                                  (isThirdFilled && index + 1 == 3)) {
                                int chosenIndex = 0;

                                if (index + 1 == 1) {
                                  chosenIndex = firstClickedIndex;
                                } else if (index + 1 == 2) {
                                  chosenIndex = secondCLickedIndex;
                                } else if (index + 1 == 3) {
                                  chosenIndex = thirdClickedIndex;
                                }
                                String chosenWord = shuffledPhrase[chosenIndex];
                                bool isCorrect = chosenWord ==
                                    correctPhrase[list[index] - 1];
                                correctList[index] = isCorrect;
                                return RoundedContainer(
                                  width: 23.w,
                                  onTap: () {
                                    switch (index + 1) {
                                      case 1:
                                        setState(() {
                                          isFirstFilled = false;
                                          count--;
                                          firstClickedIndex = -1;
                                        });
                                        break;
                                      case 2:
                                        setState(() {
                                          isSecondFilled = false;
                                          count--;
                                          secondCLickedIndex = -1;
                                        });
                                        break;
                                      case 3:
                                        setState(() {
                                          isThirdFilled = false;
                                          count--;
                                          thirdClickedIndex = -1;
                                        });
                                        break;
                                    }
                                  },
                                  padding:
                                      EdgeInsets.symmetric(vertical: 1.5.h),
                                  containerColor: isCorrect
                                      ? AppColors.darkGreen
                                      : AppColors.darkRed,
                                  radius: 15,
                                  child: Center(
                                    child: TextWidget(
                                      title: '${list[index]}. $chosenWord',
                                      textColor: isCorrect
                                          ? AppColors.green
                                          : AppColors.red,
                                    ),
                                  ),
                                );
                              }
                              return SizedBox(
                                width: 23.w,
                                child: DottedBorder(
                                  color: AppColors.gray,
                                  strokeWidth: 2,
                                  dashPattern: const [5, 10],
                                  borderType: BorderType.RRect,
                                  radius: const Radius.circular(15),
                                  padding:
                                      EdgeInsets.symmetric(vertical: 1.5.h),
                                  child: Center(
                                    child: TextWidget(title: '${list[index]}'),
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 3,
                    crossAxisSpacing: 2.h,
                    childAspectRatio: 0.5.w,
                    mainAxisSpacing: 2.h,
                    shrinkWrap: true,
                    children: List.generate(12, (index) {
                      bool isChosen = index == firstClickedIndex ||
                          index == secondCLickedIndex ||
                          index == thirdClickedIndex;
                      return RoundedContainer(
                        onTap: isChosen
                            ? null
                            : () {
                                if (count == 3) return;
                                setState(() {
                                  count++;
                                });
                                switch (count) {
                                  case 1:
                                    setState(() {
                                      isFirstFilled = true;
                                      firstClickedIndex = index;
                                    });
                                    break;
                                  case 2:
                                    setState(() {
                                      isSecondFilled = true;
                                      secondCLickedIndex = index;
                                    });
                                    break;
                                  case 3:
                                    setState(() {
                                      isThirdFilled = true;
                                      thirdClickedIndex = index;
                                    });
                                    break;
                                }
                              },
                        containerColor: AppColors.gray3,
                        radius: 15,
                        child: Center(
                          child: TextWidget(
                            title: shuffledPhrase[index],
                            textColor: isChosen ? AppColors.gray : Colors.white,
                          ),
                        ),
                      );
                    }),
                  ),
                  const Spacer(),
                  RoundedContainer(
                    onTap: () async {
                      // store locally
                      final configurationService =
                          Provider.of<ConfigurationService>(context,
                              listen: false);

                      await configurationService.setMnemonic(widget.mnemonic);
                      await configurationService.setPrivateKey(null);
                      await configurationService.setupDone(true);

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
                                child: SingleChildScrollView(
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
                                      SvgPicture.asset(
                                        'assets/svg/ic_success.svg',
                                      ),
                                      SizedBox(
                                        height: 4.h,
                                      ),
                                      Center(
                                        child: TextWidget(
                                          title: 'Congratulations',
                                          fontSize: 19.sp,
                                          textColor: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      Center(
                                        child: TextWidget(
                                          title:
                                              'You’ve successfully protected your wallet. Remember to keep your recovery phrase safe, it’s your responsibility!',
                                          fontSize: 15.sp,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 4.h,
                                      ),
                                      RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                                text:
                                                    'You can find your recovery phrase in\n',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15.sp)),
                                            TextSpan(
                                              text: 'Settings > Wallets',
                                              style: TextStyle(
                                                fontSize: 15.sp,
                                                color: AppColors.teal,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 4.h,
                                      ),
                                      RoundedContainer(
                                        onTap: () {
                                          context.router.pop();
                                        },
                                        padding: EdgeInsets.symmetric(
                                            vertical: 1.5.h),
                                        radius: 50,
                                        border: Border.all(
                                          color: AppColors.teal,
                                        ),
                                        child: Center(
                                          child: TextWidget(
                                            title: 'Done',
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
                              ),
                            );
                          });
                      if (result == null) {
                        context.router.push(const BottomNavigationRoute());
                      }
                    },
                    padding: EdgeInsets.symmetric(vertical: 1.5.h),
                    radius: 50,
                    border: Border.all(
                      color: AppColors.teal,
                    ),
                    child: Center(
                      child: TextWidget(
                        title: isFirstFilled &&
                                isSecondFilled &&
                                isThirdFilled &&
                                correctList.where((e) => e).length == 3
                            ? 'Complete Recovery'
                            : 'Continue',
                        textColor: AppColors.teal,
                        fontSize: 14.sp,
                      ),
                    ),
                  )
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
