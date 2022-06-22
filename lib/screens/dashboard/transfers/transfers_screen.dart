import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_wallet/routes/routes.dart';
import 'package:islami_wallet/theme/colors.dart';
import 'package:islami_wallet/widgets/rounded_container.dart';
import 'package:sizer/sizer.dart';

import '../../../widgets/text_widget.dart';

class TransfersPage extends StatelessWidget {
  const TransfersPage({Key? key}) : super(key: key);

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
              TextWidget(
                title: 'Swap',
                textColor: Colors.white,
                fontSize: 19.sp,
              ),
              SizedBox(
                height: 4.h,
              ),
              RoundedContainer(
                onTap: () => context.router.push(const TransferFillRoute()),
                width: double.infinity,
                containerColor: AppColors.gray3,
                radius: 20,
                padding: EdgeInsets.all(4.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextWidget(
                      title: 'From',
                      textColor: Colors.white,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    RoundedContainer(
                      width: double.infinity,
                      containerColor: AppColors.primaryColor,
                      padding: EdgeInsets.all(4.w),
                      radius: 20,
                      border: Border.all(color: AppColors.gray4),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                RoundedContainer(
                                    width: 20,
                                    height: 20,
                                    containerColor: AppColors.darkGreen2,
                                    child: Padding(
                                      padding: EdgeInsets.all(1.w),
                                      child: SvgPicture.asset(
                                        'assets/svg/ic_caizcoin.svg',
                                        width: 13,
                                        height: 12,
                                      ),
                                    )),
                                SizedBox(
                                  width: 2.w,
                                ),
                                const TextWidget(
                                  title: 'CAZ',
                                  textColor: Colors.white,
                                )
                              ],
                            ),
                            const TextWidget(title: 'Balance:219'),
                          ]),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        SvgPicture.asset('assets/svg/ic_transfer.svg'),
                        SizedBox(
                          width: 8.w,
                        ),
                      ],
                    ),
                    const TextWidget(
                      title: 'To',
                      textColor: Colors.white,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    RoundedContainer(
                      width: double.infinity,
                      containerColor: AppColors.primaryColor,
                      padding: EdgeInsets.all(4.w),
                      radius: 20,
                      border: Border.all(color: AppColors.gray4),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                RoundedContainer(
                                    width: 20,
                                    height: 20,
                                    containerColor: AppColors.orange,
                                    child: Padding(
                                      padding: EdgeInsets.all(1.w),
                                      child: SvgPicture.asset(
                                        'assets/svg/ic_islami.svg',
                                        width: 13,
                                        height: 12,
                                      ),
                                    )),
                                SizedBox(
                                  width: 2.w,
                                ),
                                const TextWidget(
                                  title: 'ISLAMI',
                                  textColor: Colors.white,
                                )
                              ],
                            ),
                            const TextWidget(title: 'BALANCE:12060'),
                          ]),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    const Center(
                        child: TextWidget(title: '1 CAZ = 1184.204 ISLAMI')),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
