import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_wallet/models/wallet_coin.dart';
import 'package:islami_wallet/widgets/text_limited_widget.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sizer/sizer.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import '../services/utilities.dart';
import '../theme/colors.dart';
import 'rounded_container.dart';
import 'text_widget.dart';

class ReceiveAssets extends StatelessWidget {
  WalletCoin coin;
  String publicAddress = '';
  String amount = '0';
  String extra = '';

  ReceiveAssets(this.coin, this.publicAddress, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return StatefulBuilder(
      builder: (BuildContext context,
          StateSetter setState /*You can rename this!*/) {
        return Scaffold(
            body: Container(
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
                    height: 3.h,
                  ),
                  TextWidget(
                    title: 'Receive ${coin.symbol}',
                    textColor: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 18.sp,
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  if (publicAddress != null &&
                      (mediaQuery.orientation == Orientation.portrait ||
                          kIsWeb))
                    QrImage(
                      data: publicAddress + extra,
                      size: 150.0,
                      backgroundColor: Colors.white,
                    ),
                  // Image.asset(
                  //   'assets/images/qr.png',
                  //   width: 200,
                  //   height: 200,
                  // ),
                  SizedBox(
                    height: 3.h,
                  ),
                  SizedBox(
                    width: 70.w,
                    child: TextWidget(
                      title:
                          'Send only ${coin.name} (${coin.symbol.toUpperCase()}) to this address. Sending any other coins may result in permenant loss.',
                      fontSize: 12.sp,
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  SizedBox(
                    width: 70.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RoundedContainer(
                          onTap: () async {
                            await Clipboard.setData(
                                ClipboardData(text: publicAddress));

                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('✓ Copied to Clipboard')));
                            // copy the wallet.
                            // log('wallet public address was copied');
                          },
                          radius: 50,
                          containerColor: AppColors.primaryColor,
                          padding: EdgeInsets.symmetric(
                              vertical: 2.w, horizontal: 2.w),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  width: 40.w,
                                  child: TextLimitedWidget(
                                    title: publicAddress,
                                    textColor: Colors.white,
                                  )),
                              SizedBox(
                                width: 4.w,
                              ),
                              SvgPicture.asset(
                                'assets/svg/ic_copy.svg',
                                height: 3.5.h,
                              )
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            // print('$publicAddress shared !');
                            await Share.share(
                              publicAddress,
                              subject: 'My Public Address to Receive',
                              // sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size
                            );
                          },
                          child: SvgPicture.asset('assets/svg/ic_share.svg'),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  RoundedContainer(
                    onTap: () {
                      showModalBottomSheet<String>(
                          isScrollControlled: true,
                          useRootNavigator: true,
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (BuildContext context) {
                            return FractionallySizedBox(
                                heightFactor: 0.7,
                                child: enterReceiveAmountMethod());
                          }).whenComplete(() {
                        setState(() {
                          if (amount != '0') {
                            extra = '?amount=$amount';
                          }
                        });
                      });
                    },
                    padding: EdgeInsets.symmetric(vertical: 1.5.h),
                    radius: 50,
                    border: Border.all(
                      color: AppColors.teal,
                    ),
                    child: Center(
                      child: TextWidget(
                        title: 'Set Amount',
                        textColor: AppColors.teal,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                ],
              ),
            ),
          ),
        ));
      },
    );
  }

  Widget enterReceiveAmountMethod() {
    return StatefulBuilder(builder:
        (BuildContext context, StateSetter setState2 /*You can rename this!*/) {
      return Container(
          decoration: const BoxDecoration(
              color: AppColors.gray3,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RoundedContainer(
                radius: 20,
                containerColor: AppColors.gray3,
                padding: EdgeInsets.all(6.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 50.w,
                          child: TextWidget(
                            title: amount,
                            textAlign: TextAlign.start,
                            fontSize: 20.sp,
                            maxLines: 1,
                          ),
                        ),
                        TextWidget(
                          title: coin.symbol.toUpperCase(),
                          textColor: Colors.white,
                          fontSize: 20.sp,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    TextWidget(
                      title:
                          '\$ ${Utilities.format(coin.price * double.parse(amount))}',
                      textColor: AppColors.gray7,
                    )
                  ],
                ),
              ),
              const Spacer(),
              NumericKeyboard(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                onKeyboardTap: (String value) {
                  setState2(() {
                    if (amount == '0') {
                      amount = value;
                    } else {
                      amount = amount + value;
                    }
                  });
                },
                textColor: Colors.white,
                rightButtonFn: () {
                  if (amount.isNotEmpty && amount != '0') {
                    setState2(() {
                      amount = amount.substring(0, amount.length - 1);
                      if (amount.isEmpty) {
                        amount = '0';
                      }
                    });
                  }
                },
                rightIcon: const Icon(
                  Icons.backspace_outlined,
                  color: Colors.white,
                ),
                leftButtonFn: () {
                  if (amount.isNotEmpty && !amount.contains('.')) {
                    setState2(() {
                      amount = '$amount.';
                    });
                  }
                },
                leftIcon: Icon(
                  Icons.circle,
                  size: 1.w,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              RoundedContainer(
                onTap: () {
                  context.router.pop();
                  // showModalBottomSheet<String>(
                  //     isScrollControlled: true,
                  //     useRootNavigator: true,
                  //     backgroundColor: Colors.transparent,
                  //     context: context,
                  //     builder: (BuildContext context) {
                  //       return sendLinkMethod();
                  //     });
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
          ));
    });
  }
}
