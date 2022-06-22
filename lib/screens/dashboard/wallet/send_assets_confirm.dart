import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_wallet/routes/routes.dart';
import 'package:islami_wallet/theme/colors.dart';
import 'package:islami_wallet/widgets/custom_icon_widget.dart';
import 'package:islami_wallet/widgets/rounded_container.dart';
import 'package:islami_wallet/widgets/text_widget.dart';
import 'package:sizer/sizer.dart';

class SendAssetsConfirmPage extends StatelessWidget {
  const SendAssetsConfirmPage({Key? key}) : super(key: key);

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
                  SizedBox(
                    width: 55.w,
                    child: Row(
                      children: [
                        const CustomIconWidget(svgName: 'ic_back'),
                        const Spacer(),
                        TextWidget(
                          title: 'Confirm',
                          textColor: Colors.white,
                          fontSize: 16.sp,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  RoundedContainer(
                    radius: 20,
                    containerColor: AppColors.gray3,
                    padding: EdgeInsets.all(4.w),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                  'assets/svg/ic_account_name.svg'),
                              SizedBox(
                                width: 4.w,
                              ),
                              TextWidget(
                                title: 'Account Name',
                                textColor: Colors.white,
                                fontSize: 16.sp,
                              )
                            ],
                          ),
                          const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Colors.white,
                          )
                        ]),
                  ),
                  SizedBox(
                    height: 2.h,
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
                            title: 'To',
                            textColor: Colors.white,
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          RoundedContainer(
                            border: Border.all(color: AppColors.gray4),
                            containerColor: AppColors.primaryColor,
                            padding: EdgeInsets.all(4.w),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 40.w,
                                    child: const TextWidget(
                                      title: '15rGLE…hsMKYP',
                                      textColor: Colors.white,
                                      maxLines: 1,
                                      overFlow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SvgPicture.asset(
                                    'assets/svg/ic_remove.svg',
                                    color: AppColors.teal,
                                  ),
                                ]),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 2.h,
                  ),
                  RoundedContainer(
                    radius: 20,
                    width: double.infinity,
                    containerColor: AppColors.gray3,
                    padding: EdgeInsets.all(6.w),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextWidget(
                              title: 'Amount',
                              textColor: Colors.white,
                              fontSize: 16.sp,
                            ),
                            TextWidget(
                              title: 'ISLAMI 1000',
                              textColor: Colors.white,
                              fontSize: 16.sp,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            TextWidget(
                              title: 'Network Fee:',
                            ),
                            TextWidget(
                              title: 'ISLAMI 10',
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        const Divider(
                          color: AppColors.gray,
                          thickness: 0.1,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextWidget(
                              title: 'TOTAL AMOUNT:',
                              textColor: Colors.white,
                              fontSize: 16.sp,
                            ),
                            TextWidget(
                              title: 'ISLAMI 1010',
                              textColor: Colors.white,
                              fontSize: 16.sp,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Spacer(),
                            TextWidget(
                              title: '\$26.17216',
                              fontSize: 15.sp,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => context.router.push(const NetworkFeeRoute()),
                    child: Center(
                        child: TextWidget(
                      title: 'Network Fee Settings',
                      textColor: AppColors.teal,
                      fontSize: 16.sp,
                    )),
                  ),
                  const Spacer(),
                  RoundedContainer(
                    onTap: () => context.router
                        .popUntilRouteWithName('BottomNavigationRoute'),
                    padding: EdgeInsets.symmetric(vertical: 1.5.h),
                    radius: 50,
                    border: Border.all(
                      color: AppColors.teal,
                    ),
                    child: Center(
                      child: TextWidget(
                        title: 'Confirm',
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
      )),
    );
  }
}
