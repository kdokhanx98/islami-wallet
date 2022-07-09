import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_wallet/routes/routes.dart';
import 'package:islami_wallet/theme/colors.dart';
import 'package:islami_wallet/widgets/custom_icon_widget.dart';
import 'package:islami_wallet/widgets/rounded_container.dart';
import 'package:islami_wallet/widgets/text_form.dart';
import 'package:islami_wallet/widgets/text_widget.dart';
import 'package:sizer/sizer.dart';

import '../../../models/wallet_coin.dart';

class SendAssetsPage extends StatefulWidget {
  final WalletCoin coin;

  const SendAssetsPage({Key? key, required this.coin}) : super(key: key);

  @override
  State<SendAssetsPage> createState() => _SendAssetsPageState();
}

class _SendAssetsPageState extends State<SendAssetsPage> {
  final _addressController = TextEditingController();

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
                    width: 60.w,
                    child: Row(
                      children: [
                        const CustomIconWidget(svgName: 'ic_back'),
                        const Spacer(),
                        TextWidget(
                          title: 'Send ${widget.coin.symbol}',
                          textColor: Colors.white,
                          fontSize: 16.sp,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  // RoundedContainer(
                  //   radius: 20,
                  //   containerColor: AppColors.gray3,
                  //   padding: EdgeInsets.all(4.w),
                  //   child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: [
                  //         Row(
                  //           children: [
                  //             SvgPicture.asset(
                  //                 'assets/svg/ic_account_name.svg'),
                  //             SizedBox(
                  //               width: 4.w,
                  //             ),
                  //             TextWidget(
                  //               title: 'Account Name',
                  //               textColor: Colors.white,
                  //               fontSize: 16.sp,
                  //             )
                  //           ],
                  //         ),
                  //         const Icon(
                  //           Icons.keyboard_arrow_down_rounded,
                  //           color: Colors.white,
                  //         )
                  //       ]),
                  // ),
                  // SizedBox(
                  //   height: 2.h,
                  // ),
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
                            padding: EdgeInsets.all(1.w),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      child: TextForm(
                                    title: 'Recipient Address',
                                    controller: _addressController,
                                  )),
                                  // SvgPicture.asset(
                                  //   'assets/svg/ic_qr_scanner.svg',
                                  //   color: AppColors.teal,
                                  // ),
                                  Row(
                                    children: [
                                      InkWell(
                                          onTap: () async {
                                            final clipboard =
                                                await Clipboard.getData(
                                                    "text/plain");
                                            if (clipboard != null &&
                                                clipboard.text != null) {
                                              _addressController.text =
                                                  clipboard.text.toString();
                                            }
                                          },
                                          child: TextWidget(
                                            title: 'Paste',
                                            textColor: AppColors.teal,
                                            fontSize: 12.sp,
                                          )),
                                      SizedBox(
                                        width: 1.w,
                                      ),
                                      CustomIconWidget(
                                        svgName: 'ic_qr_scanner',
                                        iconColor: AppColors.teal,
                                        onTap: () => context.router.push(
                                            QRScanningRoute(
                                                onScanned: (scannedAddress) {
                                          _addressController.text =
                                              scannedAddress.toString();
                                          log(_addressController.text);
                                        })),
                                      ),
                                    ],
                                  )
                                ]),
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Center(
                            child: TextWidget(
                              title: 'Transfer Between Accounts',
                              textColor: AppColors.teal,
                              fontSize: 16.sp,
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 2.h,
                  ),
                  // TextWidget(
                  //   title: 'Recent',
                  //   textColor: Colors.white,
                  //   fontSize: 16.sp,
                  //   fontWeight: FontWeight.bold,
                  // ),
                  // SizedBox(
                  //   height: 2.h,
                  // ),
                  // RoundedContainer(
                  //   radius: 20,
                  //   containerColor: AppColors.gray3,
                  //   padding: EdgeInsets.all(4.w),
                  //   child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: [
                  //         Row(
                  //           children: [
                  //             SvgPicture.asset(
                  //                 'assets/svg/ic_account_name.svg'),
                  //             SizedBox(
                  //               width: 4.w,
                  //             ),
                  //             Column(
                  //               crossAxisAlignment: CrossAxisAlignment.start,
                  //               children: [
                  //                 TextWidget(
                  //                   title: 'Account Name',
                  //                   textAlign: TextAlign.start,
                  //                   textColor: Colors.white,
                  //                   fontSize: 16.sp,
                  //                 ),
                  //                 SizedBox(
                  //                   height: 1.h,
                  //                 ),
                  //                 TextWidget(
                  //                   textAlign: TextAlign.start,
                  //                   title: '15rGLE…hsMKYP',
                  //                   fontSize: 12.sp,
                  //                 )
                  //               ],
                  //             )
                  //           ],
                  //         ),
                  //         Column(
                  //           crossAxisAlignment: CrossAxisAlignment.end,
                  //           children: [
                  //             const TextWidget(
                  //               title: 'ISLAMI 1000',
                  //               textColor: Colors.white,
                  //               textAlign: TextAlign.end,
                  //               fontWeight: FontWeight.bold,
                  //             ),
                  //             SizedBox(
                  //               height: 1.h,
                  //             ),
                  //             TextWidget(
                  //               textAlign: TextAlign.end,
                  //               title: '\$25.17216',
                  //               fontSize: 12.sp,
                  //             )
                  //           ],
                  //         ),
                  //       ]),
                  // ),
                  // SizedBox(
                  //   height: 2.h,
                  // ),
                  // RoundedContainer(
                  //   radius: 20,
                  //   containerColor: AppColors.gray3,
                  //   padding: EdgeInsets.all(4.w),
                  //   child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: [
                  //         Row(
                  //           children: [
                  //             SvgPicture.asset(
                  //                 'assets/svg/ic_account_name.svg'),
                  //             SizedBox(
                  //               width: 4.w,
                  //             ),
                  //             Column(
                  //               crossAxisAlignment: CrossAxisAlignment.start,
                  //               children: [
                  //                 TextWidget(
                  //                   title: 'Account Name',
                  //                   textAlign: TextAlign.start,
                  //                   textColor: Colors.white,
                  //                   fontSize: 16.sp,
                  //                 ),
                  //                 SizedBox(
                  //                   height: 1.h,
                  //                 ),
                  //                 TextWidget(
                  //                   textAlign: TextAlign.start,
                  //                   title: '15rGLE…hsMKYP',
                  //                   fontSize: 12.sp,
                  //                 )
                  //               ],
                  //             )
                  //           ],
                  //         ),
                  //         Column(
                  //           crossAxisAlignment: CrossAxisAlignment.end,
                  //           children: [
                  //             const TextWidget(
                  //               title: 'ISLAMI 1000',
                  //               textColor: Colors.white,
                  //               textAlign: TextAlign.end,
                  //               fontWeight: FontWeight.bold,
                  //             ),
                  //             SizedBox(
                  //               height: 1.h,
                  //             ),
                  //             TextWidget(
                  //               textAlign: TextAlign.end,
                  //               title: '\$25.17216',
                  //               fontSize: 12.sp,
                  //             )
                  //           ],
                  //         ),
                  //       ]),
                  // ),
                  const Spacer(),
                  RoundedContainer(
                    onTap: () => context.router.push(SendEnterAmountRoute(
                        recepientAddress: _addressController.text.toString(),
                        coin: widget.coin)),
                    padding: EdgeInsets.symmetric(vertical: 1.5.h),
                    radius: 50,
                    border: Border.all(
                      color: AppColors.teal,
                    ),
                    child: Center(
                      child: TextWidget(
                        title: 'Next',
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
