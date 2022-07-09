import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polls/flutter_polls.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_wallet/screens/dashboard/wallet/polls.dart';
import 'package:islami_wallet/theme/colors.dart';
import 'package:islami_wallet/widgets/rounded_container.dart';
import 'package:islami_wallet/widgets/text_widget.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../models/wallet_coin.dart';
import '../../../routes/routes.dart';
import '../../../services/wallets_service.dart';
import '../../../widgets/coin_image.dart';
import '../../../widgets/custom_icon_widget.dart';
import '../../../widgets/receive_assets_widget.dart';
import '../../../widgets/token_chart_widget.dart';
import '../../../widgets/tranaction_item_widget.dart';

enum TransactionStatus { sent, received }

enum TransactionResult { conirmed, failed, pending }

class ViewCoinPage extends StatefulWidget {
  final int index;
  final WalletCoin coin;

  const ViewCoinPage({Key? key, required this.index, required this.coin})
      : super(key: key);

  @override
  State<ViewCoinPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<ViewCoinPage> {
  bool isFirstTime = true;
  bool isVoteSubmitEnabled = false;
  late WalletsService service;

  var transactionHistory = [];
  List<Map<String, dynamic>> transactionDummyData = [
    {
      'status': TransactionStatus.sent,
      'result': TransactionResult.conirmed,
    },
    {
      'status': TransactionStatus.received,
      'result': TransactionResult.failed,
    },
    {
      'status': TransactionStatus.received,
      'result': TransactionResult.pending,
    },
    {
      'status': TransactionStatus.received,
      'result': TransactionResult.failed,
    },
  ];

  String publicAddress = '';

  @override
  void initState() {
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
        body: Stack(
      children: [
        SingleChildScrollView(
          child: Column(
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
                      // SizedBox(
                      //   height: 5.3.h,
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CustomIconWidget(
                            svgName: 'ic_back',
                          ),
                          Container(
                            padding: EdgeInsets.all(3.w),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors
                                    .gray3 //clickedItem['iconContainerColor']
                                ),
                            child: CoinImage(image: widget.coin.logo),
                            // SvgPicture.asset(
                            //   'assets/svg/${clickedItem['svgPathName']}.svg',
                            //   width: 8.w,
                            //   height: 8.w,
                            // ),
                          ),
                          CustomIconWidget(
                            svgName: 'ic_chart_view',
                            onTap: () {
                              showModalBottomSheet<String>(
                                  isScrollControlled: true,
                                  useRootNavigator: true,
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return FractionallySizedBox(
                                        heightFactor: 0.9,
                                        child: TokenChartWidget(widget.coin));
                                  });
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Center(
                        child: TextWidget(
                          title: widget.coin.name, // clickedItem['title'],
                          fontSize: 15.sp,
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Center(
                        child: TextWidget(
                          title: widget.coin
                              .displayTokens(), // clickedItem['trailingSubtitle'],
                          fontSize: 24.sp,
                          textColor: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Center(
                        child: RichText(
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: widget.coin
                                      .formatPrice(), //clickedItem['trailingTitle'],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                  )),
                              TextSpan(
                                text:
                                    ' (${widget.coin.priceChangePercentage24h.toStringAsFixed(2)})',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: () {
                                    if (widget.coin.priceChangePercentage24h
                                        .toString()
                                        .contains('-')) {
                                      return AppColors.red2;
                                    } else {
                                      return AppColors.green2;
                                    }
                                  }(),
                                ),
                              ),
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
                                context.router
                                    .push(SendAssetsRoute(coin: widget.coin));
                              }),
                          // walletAction(
                          //   svgIconName: 'ic_add_teal',
                          //   title: 'Buy',
                          //   onTap: () {
                          //     log('buy clicked');
                          //   },
                          // ),
                          walletAction(
                              svgIconName: 'ic_receive',
                              title: 'Receive',
                              onTap: () {
                                showModalBottomSheet<String>(
                                    isScrollControlled: true,
                                    useRootNavigator: true,
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (BuildContext context) {
                                      return FractionallySizedBox(
                                          heightFactor: 0.90,
                                          child: ReceiveAssets(
                                              widget.coin, publicAddress));
                                    });
                              }),
                          if (widget.coin.symbol.toLowerCase() == 'islami')
                            walletAction(
                                svgIconName: 'ic_check',
                                title: 'Vote',
                                onTap: () {
                                  if (isFirstTime) {
                                    setState(() {
                                      isFirstTime = !isFirstTime;
                                    });
                                    context.router
                                        .push(const LockTokensRoute());
                                  } else {
                                    setState(() => isVoteSubmitEnabled =
                                        !isVoteSubmitEnabled);
                                    // open your opinion matters bottom sheet

                                    showModalBottomSheet<String>(
                                        isScrollControlled: true,
                                        useRootNavigator: true,
                                        backgroundColor: Colors.transparent,
                                        context: context,
                                        builder: (BuildContext context) {
                                          return yourOpinionMethod();
                                        });
                                  }
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
                                  title: 'Today',
                                  textColor: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                            SizedBox(height: 3.h),
                            transactionHistory.isEmpty
                                ? Column(
                                    children: [
                                      const TextWidget(
                                          title: 'No transactions yet !')
                                    ],
                                  )
                                : MediaQuery.removePadding(
                                    context: context,
                                    removeTop: true,
                                    child: ListView.builder(
                                      physics: const ClampingScrollPhysics(),
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return TransactionItemWidget(
                                          status: transactionDummyData[index]
                                              ['status'],
                                          result: transactionDummyData[index]
                                              ['result'],
                                        );
                                      },
                                      itemCount: transactionDummyData.length,
                                    ),
                                  ),
                            SizedBox(
                              height: 10.h,
                            ),
                          ],
                        ),
                      ))),
            ],
          ),
        ),
        Positioned(
            bottom: 13.h,
            left: 20.w,
            right: 20.w,
            child: RoundedContainer(
              radius: 20,
              containerColor: AppColors.teal,
              padding: EdgeInsets.all(2.5.w),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/svg/ic_halal.svg',
                    width: 9.w,
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  const Flexible(
                    child: TextWidget(
                      title: 'Check Halal Status',
                      textColor: Colors.white,
                    ),
                  )
                ],
              ),
            )),
      ],
    ));
  }

  Widget walletAction(
      {required String svgIconName,
      required String title,
      void Function()? onTap,
      Color? iconColor,
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
              color: iconColor,
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

  // StatefulBuilder chartMethod() {
  //   return StatefulBuilder(
  //     builder: (BuildContext context,
  //         StateSetter setState /*You can rename this!*/) {

  //     },
  //   );
  // }

  StatefulBuilder yourOpinionMethod() {
    return StatefulBuilder(
      builder: (BuildContext context,
          StateSetter setState /*You can rename this!*/) {
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
                    height: 4.h,
                  ),
                  TextWidget(
                    title: 'Your Opinion Matters',
                    textColor: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 18.sp,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: TextWidget(title: '1/3')),
                  SizedBox(
                    height: 2.h,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: TextWidget(
                        title:
                            'Do you think ISLAMIcoin will be the next booming currency?',
                        textAlign: TextAlign.start,
                        textColor: Colors.white,
                        fontSize: 16.sp,
                      )),
                  SizedBox(
                    height: 2.h,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: polls().length,
                    itemBuilder: (BuildContext context, int index) {
                      final poll = polls()[index];

                      return FlutterPolls(
                        metaWidget: Container(),
                        heightBetweenOptions: 1.5.h,
                        pollOptionsBorder:
                            Border.all(color: AppColors.primaryColor),
                        pollOptionsHeight: 8.h,
                        votesText: '',
                        pollId: poll['id'].toString(),
                        // hasVoted: hasVoted.value,
                        // userVotedOptionId: userVotedOptionId.value,
                        onVoted: (PollOption pollOption, int newTotalVotes) {
                          // hasVoted.value = true;
                          setState(
                            () => isVoteSubmitEnabled = true,
                          );
                          // userVotedOptionId.value = pollOption.id;
                        },
                        votedBackgroundColor: AppColors.primaryColor,
                        pollOptionsFillColor: AppColors.primaryColor,
                        votedProgressColor: AppColors.darkGreen3,
                        leadingVotedProgessColor: AppColors.darkGreen3,
                        pollOptionsBorderRadius: BorderRadius.circular(15),
                        votedPollOptionsRadius: const Radius.circular(15),

                        votedCheckmark: const Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                        votesTextStyle: const TextStyle(color: Colors.white),

                        pollEnded: false,
                        pollTitle: Container(),
                        pollOptions: poll['options'].map(
                          (option) {
                            return PollOption(
                              id: option['id'],
                              title: Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 4.w, vertical: 1.h),
                                  child: TextWidget(
                                    title: option['title'],
                                    textColor: Colors.white,
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ),
                              votes: option['votes'],
                            );
                          },
                        ).toList(),

                        votedPercentageTextStyle: const TextStyle(
                          fontSize: 14,
                          color: AppColors.gray,
                          fontWeight: FontWeight.w600,
                        ),
                      );
                    },
                  ),
                  RoundedContainer(
                    isEnabled: isVoteSubmitEnabled,
                    onTap: () => context.router.pop(),
                    padding: EdgeInsets.symmetric(vertical: 1.5.h),
                    radius: 50,
                    border: Border.all(
                      color:
                          isVoteSubmitEnabled ? AppColors.teal : AppColors.gray,
                    ),
                    child: Center(
                      child: TextWidget(
                        title: 'Submit',
                        textColor: isVoteSubmitEnabled
                            ? AppColors.teal
                            : AppColors.gray,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
