import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_wallet/routes/routes.dart';
import 'package:islami_wallet/theme/colors.dart';
import 'package:islami_wallet/widgets/custom_icon_widget.dart';
import 'package:islami_wallet/widgets/rounded_container.dart';
import 'package:islami_wallet/widgets/text_widget.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../models/wallet_coin.dart';
import '../../../services/wallets_service.dart';

class SendAssetsPage extends StatefulWidget {
  final WalletCoin coin;

  const SendAssetsPage({Key? key, required this.coin}) : super(key: key);

  @override
  State<SendAssetsPage> createState() => _SendAssetsPageState();
}

class _SendAssetsPageState extends State<SendAssetsPage> {
  late WalletsService service;
  String publicAddress = '';

  @override
  void initState() {
    // clickedItem = dummyData[widget.index];
    super.initState();
    service = Provider.of<WalletsService>(context, listen: false);
    loadPublicAddress();
  }

  Future<void> loadPublicAddress() async {
    publicAddress = await service.getPublicAddress(widget.coin) ?? '';
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
                            padding: EdgeInsets.all(4.w),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const TextWidget(title: 'Recipient Address'),
                                  SvgPicture.asset(
                                    'assets/svg/ic_qr_scanner.svg',
                                    color: AppColors.teal,
                                  ),
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
                  TextWidget(
                    title: 'Recent',
                    textColor: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 2.h,
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    title: 'Account Name',
                                    textAlign: TextAlign.start,
                                    textColor: Colors.white,
                                    fontSize: 16.sp,
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  TextWidget(
                                    textAlign: TextAlign.start,
                                    title: '15rGLE…hsMKYP',
                                    fontSize: 12.sp,
                                  )
                                ],
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const TextWidget(
                                title: 'ISLAMI 1000',
                                textColor: Colors.white,
                                textAlign: TextAlign.end,
                                fontWeight: FontWeight.bold,
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              TextWidget(
                                textAlign: TextAlign.end,
                                title: '\$25.17216',
                                fontSize: 12.sp,
                              )
                            ],
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: 2.h,
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    title: 'Account Name',
                                    textAlign: TextAlign.start,
                                    textColor: Colors.white,
                                    fontSize: 16.sp,
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  TextWidget(
                                    textAlign: TextAlign.start,
                                    title: '15rGLE…hsMKYP',
                                    fontSize: 12.sp,
                                  )
                                ],
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const TextWidget(
                                title: 'ISLAMI 1000',
                                textColor: Colors.white,
                                textAlign: TextAlign.end,
                                fontWeight: FontWeight.bold,
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              TextWidget(
                                textAlign: TextAlign.end,
                                title: '\$25.17216',
                                fontSize: 12.sp,
                              )
                            ],
                          ),
                        ]),
                  ),
                  const Spacer(),
                  RoundedContainer(
                    onTap: () =>
                        context.router.push(const SendEnterAmountRoute()),
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
