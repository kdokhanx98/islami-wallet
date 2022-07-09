import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../models/wallet_coin.dart';
import '../theme/colors.dart';
import 'rounded_container.dart';
import 'text_widget.dart';

class TokenChartWidget extends StatelessWidget {
  WalletCoin coin;
  TokenChartWidget(this.coin, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColors.gray3,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
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
                height: 2.h,
              ),
              TextWidget(
                title: coin.name,
              ),
              SizedBox(
                height: 2.h,
              ),
              TextWidget(
                title: coin.formatPrice(),
                fontSize: 35.sp,
                textColor: Colors.white,
                fontWeight: FontWeight.w800,
              ),
              SizedBox(
                height: 2.h,
              ),
              TextWidget(
                title: '(${coin.priceChangePercentage24h.toStringAsFixed(2)})',
                textColor: () {
                  if (coin.priceChangePercentage24h.toString().contains('-')) {
                    return AppColors.red2;
                  } else {
                    return AppColors.green2;
                  }
                }(),
              ),
              SizedBox(
                height: 2.h,
              ),
              RoundedContainer(
                radius: 20,
                containerColor: AppColors.primaryColor,
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 1.5.h),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RoundedContainer(
                        containerColor: AppColors.teal,
                        padding: EdgeInsets.symmetric(
                            horizontal: 4.w, vertical: 0.8.h),
                        child: const TextWidget(
                          title: '1H',
                          textColor: Colors.white,
                        ),
                      ),
                      const TextWidget(
                        title: '1D',
                        textColor: Colors.white,
                      ),
                      const TextWidget(
                        title: '1W',
                        textColor: Colors.white,
                      ),
                      const TextWidget(
                        title: '1M',
                        textColor: Colors.white,
                      ),
                      const TextWidget(
                        title: '1Y',
                        textColor: Colors.white,
                      ),
                      const TextWidget(
                        title: 'All',
                        textColor: Colors.white,
                      ),
                    ]),
              ),
              SizedBox(
                height: 3.h,
              ),
              RoundedContainer(
                containerColor: AppColors.primaryColor,
                radius: 20,
                padding: EdgeInsets.all(4.w),
                child: Image.asset('assets/images/chart.png'),
              ),
              SizedBox(
                height: 3.h,
              ),
              RoundedContainer(
                containerColor: AppColors.primaryColor,
                radius: 20,
                padding: EdgeInsets.all(4.w),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const TextWidget(title: 'Daily Change'),
                        TextWidget(
                          title: '4,089%',
                          textColor: AppColors.green2,
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
                        const TextWidget(title: 'High Price'),
                        TextWidget(
                          title: '\$ 0.002986',
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
                        const TextWidget(title: 'Daily Change'),
                        TextWidget(
                          title: '\$ 0.002336',
                          textColor: Colors.white,
                          fontSize: 16.sp,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              // RoundedContainer(
              //   onTap: () {
              //     context.router.pop();
              //   },
              //   padding: EdgeInsets.symmetric(vertical: 1.5.h),
              //   radius: 50,
              //   border: Border.all(
              //     color: AppColors.teal,
              //   ),
              //   child: Center(
              //     child: TextWidget(
              //       title: 'Buy Now',
              //       textColor: AppColors.teal,
              //       fontSize: 14.sp,
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 3.h,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
