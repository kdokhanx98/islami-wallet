import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:islami_wallet/theme/colors.dart';
import 'package:islami_wallet/widgets/custom_icon_widget.dart';
import 'package:islami_wallet/widgets/rounded_container.dart';
import 'package:islami_wallet/widgets/text_widget.dart';
import 'package:sizer/sizer.dart';

enum BasicFee { slow, average, fast }

class NetworkFeePage extends StatefulWidget {
  const NetworkFeePage({Key? key}) : super(key: key);

  @override
  State<NetworkFeePage> createState() => _NetworkFeePageState();
}

class _NetworkFeePageState extends State<NetworkFeePage> {
  BasicFee? _character = BasicFee.slow;

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
            SizedBox(
              width: double.infinity,
              child: Row(
                children: [
                  const CustomIconWidget(svgName: 'ic_back'),
                  SizedBox(
                    width: 10.w,
                  ),
                  TextWidget(
                    title: 'Network fee Settings',
                    textColor: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            SizedBox(
              height: 80.h,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 4.h,
                    ),
                    RoundedContainer(
                      radius: 20,
                      containerColor: AppColors.gray3,
                      padding:
                          EdgeInsets.symmetric(horizontal: 4.w, vertical: 6.w),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            TextWidget(
                              title: 'TOTAL FEE',
                              textColor: AppColors.orange,
                            ),
                            TextWidget(
                              title: '10 ISLAMI',
                              fontWeight: FontWeight.bold,
                              textColor: AppColors.orange,
                            ),
                          ]),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    TextWidget(
                      title: 'Basic',
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                      textColor: Colors.white,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    RoundedContainer(
                      containerColor: AppColors.gray3,
                      padding: EdgeInsets.all(6.w),
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          disabledColor: AppColors.gray,
                          unselectedWidgetColor: AppColors.gray,
                        ),
                        child: RadioListTile<BasicFee>(
                          dense: true,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 0),
                          controlAffinity: ListTileControlAffinity.trailing,
                          activeColor: AppColors.orange,
                          title: const TextWidget(
                            title: '\$ 0.23',
                            textColor: Colors.white,
                            textAlign: TextAlign.end,
                          ),
                          secondary: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                textAlign: TextAlign.start,
                                title: 'Slow',
                                fontSize: 15.sp,
                                textColor: Colors.white,
                              ),
                              SizedBox(
                                height: 0.5.h,
                              ),
                              const TextWidget(
                                title: '10 ISLAMI',
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                          value: BasicFee.slow,
                          groupValue: _character,
                          onChanged: (BasicFee? value) {
                            setState(() {
                              _character = value;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    RoundedContainer(
                      containerColor: AppColors.gray3,
                      padding: EdgeInsets.all(6.w),
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          disabledColor: AppColors.gray,
                          unselectedWidgetColor: AppColors.gray,
                        ),
                        child: RadioListTile<BasicFee>(
                          dense: true,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 0),
                          controlAffinity: ListTileControlAffinity.trailing,
                          activeColor: AppColors.orange,
                          title: const TextWidget(
                            title: '\$ 0.35',
                            textColor: Colors.white,
                            textAlign: TextAlign.end,
                          ),
                          secondary: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                textAlign: TextAlign.start,
                                title: 'Average',
                                fontSize: 15.sp,
                                textColor: Colors.white,
                              ),
                              SizedBox(
                                height: 0.5.h,
                              ),
                              const TextWidget(
                                title: '23 ISLAMI',
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                          value: BasicFee.average,
                          groupValue: _character,
                          onChanged: (BasicFee? value) {
                            setState(() {
                              _character = value;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    RoundedContainer(
                      containerColor: AppColors.gray3,
                      padding: EdgeInsets.all(6.w),
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          disabledColor: AppColors.gray,
                          unselectedWidgetColor: AppColors.gray,
                        ),
                        child: RadioListTile<BasicFee>(
                          dense: true,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 0),
                          controlAffinity: ListTileControlAffinity.trailing,
                          activeColor: AppColors.orange,
                          title: const TextWidget(
                            title: '\$ 0.75',
                            textColor: Colors.white,
                            textAlign: TextAlign.end,
                          ),
                          secondary: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                textAlign: TextAlign.start,
                                title: 'Fast',
                                fontSize: 15.sp,
                                textColor: Colors.white,
                              ),
                              SizedBox(
                                height: 0.5.h,
                              ),
                              const TextWidget(
                                title: '50 ISLAMI',
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                          value: BasicFee.fast,
                          groupValue: _character,
                          onChanged: (BasicFee? value) {
                            setState(() {
                              _character = value;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    TextWidget(
                      title: 'Advanced',
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                      textColor: Colors.white,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    RoundedContainer(
                      width: double.infinity,
                      containerColor: AppColors.gray3,
                      padding: EdgeInsets.all(4.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            title: 'Gas Limit',
                            textColor: Colors.white,
                            fontSize: 15.sp,
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          RoundedContainer(
                            width: double.infinity,
                            border: Border.all(color: AppColors.gray4),
                            containerColor: AppColors.primaryColor,
                            padding: EdgeInsets.all(4.w),
                            child: const TextWidget(
                              title: '21000',
                              textColor: Colors.white,
                              textAlign: TextAlign.start,
                              maxLines: 1,
                              overFlow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          TextWidget(
                            title: 'Gas Price (GWEI)',
                            textColor: Colors.white,
                            fontSize: 15.sp,
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          RoundedContainer(
                            width: double.infinity,
                            border: Border.all(color: AppColors.gray4),
                            containerColor: AppColors.primaryColor,
                            padding: EdgeInsets.all(4.w),
                            child: const TextWidget(
                              title: '76.983768',
                              textColor: Colors.white,
                              textAlign: TextAlign.start,
                              maxLines: 1,
                              overFlow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    RoundedContainer(
                      onTap: () => context.router.pop(),
                      padding: EdgeInsets.symmetric(vertical: 1.5.h),
                      radius: 50,
                      border: Border.all(
                        color: AppColors.teal,
                      ),
                      child: Center(
                        child: TextWidget(
                          title: 'Save',
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
        ),
      )),
    );
  }
}
