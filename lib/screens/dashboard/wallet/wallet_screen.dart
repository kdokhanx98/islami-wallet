import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_wallet/routes/routes.dart';
import 'package:islami_wallet/theme/colors.dart';
import 'package:islami_wallet/widgets/rounded_container.dart';
import 'package:islami_wallet/widgets/text_widget.dart';
import 'package:sizer/sizer.dart';

import '../../../widgets/asset_item_widget.dart';
import '../../../widgets/custom_icon_widget.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  List<Map<String, dynamic>> dummyData = [
    {
      'title': 'IslamiCoin',
      'subtitle': '\$0.002336',
      'subtitlePercentage': '(-14.38%)',
      'trailingTitle': '12060 ISLAMI',
      'trailingSubtitle': '\$28.17216',
      'svgPathName': 'ic_islami',
      'iconContainerColor': AppColors.orange,
    },
    {
      'title': 'Ethereum',
      'subtitle': '\$1,983.71',
      'subtitlePercentage': '(-0.70%)',
      'trailingTitle': '1.56 ETH',
      'trailingSubtitle': '\$3094.5876',
      'svgPathName': 'ic_ethereum',
      'iconContainerColor': Colors.black,
    },
    {
      'title': 'Bitcoin',
      'subtitle': '\$29,777.21',
      'subtitlePercentage': '(+1.37%)',
      'trailingTitle': '0.0123 BTC',
      'trailingSubtitle': '\$366.26',
      'svgPathName': 'ic_bitcoin',
      'iconContainerColor': AppColors.orange2,
    },
    {
      'title': 'CAIZCOIN',
      'subtitle': '\$2.7663',
      'subtitlePercentage': '(-3.03%)',
      'trailingTitle': '219 CAZ',
      'trailingSubtitle': '\$605.82',
      'svgPathName': 'ic_caizcoin',
      'iconContainerColor': AppColors.darkGreen2,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.gray4,
              ),
              color: AppColors.gray3,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
          child: Padding(
            padding: EdgeInsets.only(left: 5.w, right: 5.w, bottom: 4.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 6.7.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomIconWidget(
                      svgName: 'ic_qr_scanner',
                      onTap: () => context.router.push(const QRScanningRoute()),
                    ),
                    CustomIconWidget(
                      svgName: 'ic_add_assets',
                      onTap: () {
                        log('add assets tapped');
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Center(
                  child: TextWidget(
                    title: 'Current Balance',
                    fontSize: 15.sp,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Center(
                  child: TextWidget(
                    title: '\$45.650,000',
                    fontSize: 30.sp,
                    textColor: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Center(
                  child: RoundedContainer(
                    onTap: () {
                      // copy the wallet.
                      log('walled was copied');
                    },
                    radius: 50,
                    containerColor: AppColors.primaryColor,
                    padding: EdgeInsets.only(top: 1.w, bottom: 1.w, right: 2.w),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const TextWidget(
                          title: '15rGLE…hsMKYP',
                          textColor: Colors.white,
                        ),
                        SvgPicture.asset(
                          'assets/svg/ic_copy.svg',
                          height: 3.5.h,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    walletAction(
                        svgIconName: 'ic_send',
                        title: 'Send',
                        onTap: () {
                          log('send clicked');
                        }),
                    walletAction(
                        svgIconName: 'ic_add',
                        title: 'Buy',
                        onTap: () {
                          log('buy clicked');
                        },
                        containerColor: AppColors.teal),
                    walletAction(
                        svgIconName: 'ic_receive',
                        title: 'Receive',
                        onTap: () {
                          log('receive clicked');
                        }),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: SizedBox(
                height: 50.h,
                child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 3.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextWidget(
                            title: 'My Assets',
                            textColor: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          GestureDetector(
                            onTap: () {
                              // open filter bottom sheet
                              log('filter tapped');
                            },
                            child: const TextWidget(
                              title: 'Filter',
                              textColor: AppColors.teal,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 3.h),
                      MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: ListView.builder(
                          physics: const ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return AssetItemWidget(
                              svgPathName:
                                  dummyData[index]['svgPathName'] ?? 'N/A',
                              iconContainerColor: dummyData[index]
                                      ['iconContainerColor'] ??
                                  Colors.black,
                              title: dummyData[index]['title'] ?? 'N/A',
                              subtitle: dummyData[index]['subtitle'] ?? 'N/A',
                              subtitlePercentage: dummyData[index]
                                      ['subtitlePercentage'] ??
                                  'N/A',
                              trailingTitle:
                                  dummyData[index]['trailingTitle'] ?? 'N/A',
                              trailingSubtitle:
                                  dummyData[index]['trailingSubtitle'] ?? 'N/A',
                            );
                          },
                          itemCount: dummyData.length,
                        ),
                      ),
                    ],
                  ),
                ))),
      ],
    ));
  }

  Widget walletAction(
      {required String svgIconName,
      required String title,
      void Function()? onTap,
      Color? containerColor = AppColors.primaryColor}) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            padding: EdgeInsets.all(3.w),
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: containerColor),
            child: SvgPicture.asset(
              'assets/svg/$svgIconName.svg',
              width: 24,
              height: 24,
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          TextWidget(
            title: title,
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
