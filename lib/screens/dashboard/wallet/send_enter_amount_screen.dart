import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_wallet/routes/routes.dart';
import 'package:islami_wallet/widgets/custom_icon_widget.dart';
import 'package:islami_wallet/widgets/text_widget.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:sizer/sizer.dart';

import '../../../models/wallet_coin.dart';
import '../../../services/utilities.dart';
import '../../../theme/colors.dart';
import '../../../widgets/coin_image.dart';
import '../../../widgets/rounded_container.dart';

class SendEnterAmountPage extends StatefulWidget {
  final String recepientAddress;
  final WalletCoin coin;
  const SendEnterAmountPage(
      {Key? key, required this.coin, required this.recepientAddress})
      : super(key: key);

  @override
  State<SendEnterAmountPage> createState() => _SendEnterAmountPageState();
}

class _SendEnterAmountPageState extends State<SendEnterAmountPage> {
  String amount = '0';
  RegExp regex = RegExp(r'([.]*0)(?!.*\d)');

  _onKeyboardTap(String value) {
    var temp = '';
    if (amount == '0') {
      temp = value;
    } else {
      temp = amount + value;
    }
    if (double.parse(temp) > widget.coin.tokens) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Cannot exceed ${widget.coin.displayTokens()} !')));
      return;
    }
    setState(() {
      amount = temp;
    });
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
                  const Spacer(),
                  RoundedContainer(
                      radius: 30,
                      width: double.infinity,
                      containerColor: AppColors.gray3,
                      border: Border.all(color: AppColors.gray4),
                      padding: EdgeInsets.all(6.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                              onTap: () {
                                String tokens = widget.coin.tokens
                                    .toString()
                                    .replaceAll(regex, '');
                                setState(() {
                                  amount = tokens;
                                });
                              },
                              child: SvgPicture.asset('assets/svg/ic_max.svg')),
                          Column(
                            children: [
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width - 200,
                                  child: TextWidget(
                                    title:
                                        '${Utilities.format(double.parse(amount))}  ${widget.coin.symbol.toUpperCase()}',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.sp,
                                    textColor: AppColors.gray7,
                                  )),
                              SizedBox(
                                height: 0.5.h,
                              ),
                              TextWidget(
                                  title:
                                      '\$ ${Utilities.format(double.parse(amount) * widget.coin.price)}'),
                            ],
                          ),
                          GestureDetector(
                              onTap: () {},
                              child:
                                  SvgPicture.asset('assets/svg/ic_change.svg')),
                        ],
                      )),
                  const Spacer(),
                  const Center(child: TextWidget(title: 'My Balance')),
                  SizedBox(
                    height: 1.h,
                  ),
                  RoundedContainer(
                      radius: 30,
                      width: double.infinity,
                      containerColor: AppColors.gray3,
                      padding:
                          EdgeInsets.symmetric(horizontal: 3.w, vertical: 4.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              RoundedContainer(
                                  width: 30,
                                  height: 30,
                                  containerColor: AppColors.gray3,
                                  child: Padding(
                                    padding: EdgeInsets.all(1.w),
                                    child: CoinImage(image: widget.coin.logo),
                                    // SvgPicture.asset(
                                    //   'assets/svg/ic_islami.svg',
                                    // ),
                                  )),
                              // SizedBox(
                              //   width: 2.w,
                              // ),
                              TextWidget(
                                title: widget.coin.name,
                                textColor: Colors.white,
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              TextWidget(
                                title: widget.coin.displayTokens(),
                                textColor: Colors.white,
                                fontWeight: FontWeight.bold,
                                textAlign: TextAlign.end,
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              TextWidget(
                                title: widget.coin.getBalance(),
                                textAlign: TextAlign.end,
                              )
                            ],
                          ),
                        ],
                      )),
                  NumericKeyboard(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    onKeyboardTap: _onKeyboardTap,
                    textColor: Colors.white,
                    rightButtonFn: () {
                      if (amount.isNotEmpty && amount != '0') {
                        setState(() {
                          amount = amount.substring(0, amount.length - 1);
                          if (amount.isEmpty) {
                            amount = '0';
                          }
                          if (amount.endsWith('.')) {
                            amount = amount.substring(0, amount.length - 1);
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
                        setState(() {
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
                  const Spacer(),
                  RoundedContainer(
                    onTap: () {
                      var sentAmount = double.parse(amount);
                      if (sentAmount == 0) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Please enter amount !')));
                        return;
                      }
                      context.router.push(SendAssetsConfirmRoute(
                          recepientAddress: widget.recepientAddress,
                          coin: widget.coin,
                          amount: sentAmount));
                    },
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
