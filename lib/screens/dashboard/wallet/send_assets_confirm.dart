import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_wallet/models/wallet_info.dart';
import 'package:islami_wallet/routes/routes.dart';
import 'package:islami_wallet/theme/colors.dart';
import 'package:islami_wallet/widgets/custom_icon_widget.dart';
import 'package:islami_wallet/widgets/rounded_container.dart';
import 'package:islami_wallet/widgets/text_widget.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../models/wallet_coin.dart';
import '../../../services/utilities.dart';
import '../../../services/wallets_service.dart';
import '../../../widgets/text_limited_widget.dart';

class SendAssetsConfirmPage extends StatefulWidget {
  final WalletCoin coin;
  final String recepientAddress;
  final double amount;
  const SendAssetsConfirmPage(
      {Key? key,
      required this.coin,
      required this.recepientAddress,
      required this.amount})
      : super(key: key);

  @override
  State<SendAssetsConfirmPage> createState() => _SendAssetsConfirmPageState();
}

class _SendAssetsConfirmPageState extends State<SendAssetsConfirmPage> {
  late WalletsService service;
  String fromAddress = '';

  WalletInfo? wallet;

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    service = Provider.of<WalletsService>(context, listen: false);
    loadPublicAddress();
  }

  Future<void> loadPublicAddress() async {
    var wallets = await service.load();
    wallet = wallets.current;
    fromAddress = await service.getPublicAddress(widget.coin) ?? '';
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: CustomScrollView(slivers: [
        SliverFillRemaining(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  // width: 55.w,
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
                isLoading
                    ? const CircularProgressIndicator.adaptive(
                        backgroundColor: AppColors.teal)
                    : RoundedContainer(
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
                                    title: wallet == null
                                        ? 'Account Name'
                                        : wallet!.name,
                                    textColor: Colors.white,
                                    fontSize: 16.sp,
                                  )
                                ],
                              ),
                              // const Icon(
                              //   Icons.keyboard_arrow_down_rounded,
                              //   color: Colors.white,
                              // )
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 50.w,
                                  child: TextLimitedWidget(
                                    title: widget.recepientAddress,
                                    textColor: Colors.white,
                                    maxLines: 1,
                                    overFlow: TextOverflow.ellipsis,
                                  ),
                                ),
                                // SvgPicture.asset(
                                //   'assets/svg/ic_remove.svg',
                                //   color: AppColors.teal,
                                // ),
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
                            title: '${widget.amount} ${widget.coin.symbol}',
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
                          const TextWidget(
                            title: 'Network Fee',
                          ),
                          TextWidget(
                            title: '0 ${widget.coin.symbol}',
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
                            title: 'TOTAL AMOUNT',
                            textColor: Colors.white,
                            fontSize: 16.sp,
                          ),
                          TextWidget(
                            title: '${widget.amount} ${widget.coin.symbol}',
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
                            title:
                                '\$ ${Utilities.format(widget.amount * widget.coin.price)}',
                            fontSize: 15.sp,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // SizedBox(
                //   height: 6.h,
                // ),
                // GestureDetector(
                //   behavior: HitTestBehavior.opaque,
                //   onTap: () => context.router.push(const NetworkFeeRoute()),
                //   child: Center(
                //       child: TextWidget(
                //     title: 'Network Fee Settings',
                //     textColor: AppColors.teal,
                //     fontSize: 16.sp,
                //   )),
                // ),
                // SizedBox(
                //   height: 8.h,
                // ),
                const Spacer(),
                RoundedContainer(
                  onTap: () async {
                    final success = await service.transfer(
                              widget.coin,
                              widget.recepientAddress,
                              widget.amount,
                            );

                            if (success) {
                              context.router
                                  .popUntilRouteWithName('BottomNavigationRoute');
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                  content: Text('Failed to transfer money')));
                            }
                    
                  },
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
        )
      ])),
    );
  }
}
