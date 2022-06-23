import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_wallet/theme/colors.dart';
import 'package:islami_wallet/widgets/rounded_container.dart';
import 'package:islami_wallet/widgets/text_widget.dart';
import 'package:sizer/sizer.dart';

import '../../../routes/routes.dart';
import '../../../widgets/custom_icon_widget.dart';
import '../../../widgets/tranaction_item_widget.dart';

enum TransactionStatus { sent, received }

enum TransactionResult { conirmed, failed, pending }

class ViewCoinPage extends StatefulWidget {
  final int index;
  const ViewCoinPage({Key? key, required this.index}) : super(key: key);

  @override
  State<ViewCoinPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<ViewCoinPage> {
  bool isFirstTime = true;
  bool isVoteSubmitEnabled = false;
  final _searchTextController = TextEditingController();

  List<Map<String, dynamic>> dummyData = [
    {
      'title': 'IslamiCoin',
      'subtitle': '\$0.002336',
      'subtitlePercentage': '(-14.38%)',
      'trailingTitle': '12060 ISLAMI',
      'trailingSubtitle': '\$28.17216',
      'svgPathName': 'ic_islami',
      'iconContainerColor': AppColors.orange,
      'iconCode': 'ISLAMI',
    },
    {
      'title': 'Ethereum',
      'subtitle': '\$1,983.71',
      'subtitlePercentage': '(-0.70%)',
      'trailingTitle': '1.56 ETH',
      'trailingSubtitle': '\$3094.5876',
      'svgPathName': 'ic_ethereum',
      'iconContainerColor': Colors.black,
      'iconCode': 'ETH',
    },
    {
      'title': 'Bitcoin',
      'subtitle': '\$29,777.21',
      'subtitlePercentage': '(+1.37%)',
      'trailingTitle': '0.0123 BTC',
      'trailingSubtitle': '\$366.26',
      'svgPathName': 'ic_bitcoin',
      'iconContainerColor': AppColors.orange2,
      'iconCode': 'BTC',
    },
    {
      'title': 'CAIZCOIN',
      'subtitle': '\$2.7663',
      'subtitlePercentage': '(-3.03%)',
      'trailingTitle': '219 CAZ',
      'trailingSubtitle': '\$605.82',
      'svgPathName': 'ic_caizcoin',
      'iconContainerColor': AppColors.darkGreen2,
      'iconCode': 'CAZ',
    },
  ];
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

  late Map<String, dynamic> clickedItem;

  @override
  void initState() {
    clickedItem = dummyData[widget.index];
    super.initState();
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
                      SizedBox(
                        height: 5.3.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CustomIconWidget(
                            svgName: 'ic_back',
                          ),
                          Container(
                            padding: EdgeInsets.all(3.w),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: clickedItem['iconContainerColor']),
                            child: SvgPicture.asset(
                              'assets/svg/${clickedItem['svgPathName']}.svg',
                              width: 8.w,
                              height: 8.w,
                            ),
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
                                        child: chartMethod());
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
                          title: clickedItem['title'],
                          fontSize: 15.sp,
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Center(
                        child: TextWidget(
                          title: clickedItem['trailingSubtitle'],
                          fontSize: 35.sp,
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
                                  text: clickedItem['trailingTitle'],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                  )),
                              TextSpan(
                                text: clickedItem['subtitlePercentage'],
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: () {
                                    if (clickedItem['subtitlePercentage']
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
                                context.router.push(const SendAssetsRoute());
                              }),
                          walletAction(
                            svgIconName: 'ic_add_teal',
                            title: 'Buy',
                            onTap: () {
                              log('buy clicked');
                            },
                          ),
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
                                          child: selectAssetsMethod('receive'));
                                    });
                              }),
                          walletAction(
                              svgIconName: 'ic_check',
                              title: 'Vote',
                              onTap: () {
                                if (isFirstTime) {
                                  setState(() {
                                    isFirstTime = !isFirstTime;
                                  });
                                  context.router.push(const LockTokensRoute());
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
                            MediaQuery.removePadding(
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

  StatefulBuilder chartMethod() {
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
                    height: 2.h,
                  ),
                  const TextWidget(
                    title: 'IslamiCoin',
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  TextWidget(
                    title: '\$0.002336',
                    fontSize: 35.sp,
                    textColor: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  const TextWidget(
                    title: '(-14.38%)',
                    textColor: AppColors.red2,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  RoundedContainer(
                    radius: 20,
                    containerColor: AppColors.primaryColor,
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 1.5.h),
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
                  RoundedContainer(
                    onTap: () {
                      context.router.pop();
                    },
                    padding: EdgeInsets.symmetric(vertical: 1.5.h),
                    radius: 50,
                    border: Border.all(
                      color: AppColors.teal,
                    ),
                    child: Center(
                      child: TextWidget(
                        title: 'Buy Now',
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
        );
      },
    );
  }

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
                    height: 4.h,
                  ),
                  RoundedContainer(
                      onTap: () {
                        setState(() {
                          isVoteSubmitEnabled = !isVoteSubmitEnabled;
                        });
                      },
                      width: double.infinity,
                      radius: 20,
                      containerColor: AppColors.primaryColor,
                      padding: EdgeInsets.all(6.w),
                      child: const TextWidget(
                        title: 'Yes I\'m sure',
                        textColor: Colors.white,
                        textAlign: TextAlign.start,
                      )),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  RoundedContainer(
                      onTap: () {
                        setState(() {
                          isVoteSubmitEnabled = !isVoteSubmitEnabled;
                        });
                      },
                      width: double.infinity,
                      radius: 20,
                      containerColor: AppColors.primaryColor,
                      padding: EdgeInsets.all(6.w),
                      child: const TextWidget(
                        title: 'Maybe',
                        textColor: Colors.white,
                        textAlign: TextAlign.start,
                      )),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  RoundedContainer(
                      onTap: () {
                        setState(() {
                          isVoteSubmitEnabled = !isVoteSubmitEnabled;
                        });
                      },
                      width: double.infinity,
                      radius: 20,
                      containerColor: AppColors.primaryColor,
                      padding: EdgeInsets.all(6.w),
                      child: const TextWidget(
                        title: 'Nah',
                        textColor: Colors.white,
                        textAlign: TextAlign.start,
                      )),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  SizedBox(
                    height: 4.h,
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

  StatefulBuilder selectAssetsMethod(String method) {
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
                    title: 'Select Asset',
                    textColor: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 18.sp,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  RoundedContainer(
                    radius: 20,
                    containerColor: AppColors.primaryColor,
                    padding: EdgeInsets.all(4.w),
                    child: Row(children: [
                      SvgPicture.asset('assets/svg/ic_search.svg'),
                      SizedBox(
                        width: 4.w,
                      ),
                      SizedBox(
                        width: 70.w,
                        child: TextField(
                          style: const TextStyle(color: Colors.white),
                          controller: _searchTextController,
                          cursorColor: Colors.white,
                          autocorrect: false,
                          decoration: const InputDecoration.collapsed(
                            hintText: 'Search Assets',
                            hintStyle: TextStyle(
                                color: AppColors.gray,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ),
                    ]),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  SizedBox(
                    height: 60.h,
                    child: ListView.builder(
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () {
                              switch (method) {
                                case 'receive':
                                  context.router.pop().then(
                                      (value) => showModalBottomSheet<String>(
                                          isScrollControlled: true,
                                          useRootNavigator: true,
                                          backgroundColor: Colors.transparent,
                                          context: context,
                                          builder: (BuildContext context) {
                                            return reciveAssetsPopup();
                                          }));
                                  break;
                                case 'send':
                                  log('from send');
                                  break;
                              }
                            },
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 0, vertical: 2.h),
                            dense: true,
                            title: Row(
                              children: [
                                Container(
                                  width: 48,
                                  height: 48,
                                  padding: EdgeInsets.all(3.w),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: dummyData[index]
                                          ['iconContainerColor']),
                                  child: SvgPicture.asset(
                                    'assets/svg/${dummyData[index]['svgPathName']}.svg',
                                    width: 24,
                                    height: 24,
                                  ),
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                TextWidget(
                                  textAlign: TextAlign.start,
                                  title: dummyData[index]['title'],
                                  fontSize: 15.sp,
                                  textColor: Colors.white,
                                ),
                              ],
                            ),
                            trailing: TextWidget(
                              title: (dummyData[index]['iconCode'] ?? 'N/A'),
                              textColor: Colors.white,
                            ),
                          );
                        },
                        itemCount: dummyData.length,
                        shrinkWrap: true),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  StatefulBuilder reciveAssetsPopup() {
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
                    height: 3.h,
                  ),
                  TextWidget(
                    title: 'Receive Assets',
                    textColor: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 18.sp,
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Image.asset(
                    'assets/images/qr.png',
                    width: 200,
                    height: 200,
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  SizedBox(
                    width: 70.w,
                    child: const TextWidget(
                        title:
                            'Far far away, behind the word mountains, far from the countries'),
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
                          onTap: () {
                            // copy the wallet.
                            log('walled was copied');
                          },
                          radius: 50,
                          containerColor: AppColors.primaryColor,
                          padding: EdgeInsets.symmetric(
                              vertical: 2.w, horizontal: 2.w),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const TextWidget(
                                title: 'https://islami…24jq',
                                textColor: Colors.white,
                              ),
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
                        SvgPicture.asset('assets/svg/ic_share.svg')
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  RoundedContainer(
                    onTap: () {
                      context.router.pop().then((value) =>
                          context.router.push(const EnterAmountRoute()));
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
        );
      },
    );
  }
}
