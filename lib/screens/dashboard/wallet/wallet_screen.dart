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

enum SingingCharacter { highBalance, createdDate }

class WalletPage extends StatefulWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  final _searchTextController = TextEditingController();
  SingingCharacter? _character = SingingCharacter.highBalance;
  bool showAsset = true;
  bool addIslam = false;
  bool addEtherum = false;
  bool addBircoin = false;
  bool addCaizcoin = false;
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
                        showModalBottomSheet<String>(
                            isScrollControlled: true,
                            useRootNavigator: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (BuildContext context) {
                              return FractionallySizedBox(
                                  heightFactor: 0.90, child: addAssetsMethod());
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
                            onTap: () async {
                              // open filter bottom sheet
                              showModalBottomSheet<String>(
                                  isScrollControlled: true,
                                  useRootNavigator: true,
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return FractionallySizedBox(
                                        heightFactor: 0.7,
                                        child: filterMethod());
                                  });
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

  StatefulBuilder filterMethod() {
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
                  title: 'Filter',
                  textColor: Colors.white,
                  fontSize: 18.sp,
                ),
                SizedBox(
                  height: 2.h,
                ),
                RoundedContainer(
                  radius: 30,
                  width: double.infinity,
                  containerColor: AppColors.primaryColor,
                  padding: EdgeInsets.all(5.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextWidget(
                        title: 'Sort By',
                        fontWeight: FontWeight.bold,
                        textColor: Colors.white,
                        fontSize: 16.sp,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(
                          disabledColor: AppColors.gray,
                          unselectedWidgetColor: AppColors.gray,
                        ),
                        child: RadioListTile<SingingCharacter>(
                          dense: true,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 0),
                          controlAffinity: ListTileControlAffinity.trailing,
                          activeColor: AppColors.orange,
                          title: TextWidget(
                            textAlign: TextAlign.start,
                            title: 'High Balance',
                            fontSize: 15.sp,
                            textColor: Colors.white,
                          ),
                          value: SingingCharacter.highBalance,
                          groupValue: _character,
                          onChanged: (SingingCharacter? value) {
                            setState(() {
                              _character = value;
                            });
                          },
                        ),
                      ),
                      const Divider(
                        color: AppColors.gray,
                        thickness: 0.1,
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(
                          disabledColor: AppColors.gray,
                          unselectedWidgetColor: AppColors.gray,
                        ),
                        child: RadioListTile<SingingCharacter>(
                          controlAffinity: ListTileControlAffinity.trailing,
                          dense: true,
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 0),
                          activeColor: AppColors.orange,
                          title: TextWidget(
                            textAlign: TextAlign.start,
                            title: 'Created Date',
                            fontSize: 15.sp,
                            textColor: Colors.white,
                          ),
                          value: SingingCharacter.createdDate,
                          groupValue: _character,
                          onChanged: (SingingCharacter? value) {
                            setState(() {
                              _character = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                RoundedContainer(
                  radius: 30,
                  width: double.infinity,
                  containerColor: AppColors.primaryColor,
                  padding: EdgeInsets.all(5.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextWidget(
                        title: 'Show',
                        fontWeight: FontWeight.bold,
                        textColor: Colors.white,
                        fontSize: 16.sp,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      SwitchListTile.adaptive(
                          contentPadding: const EdgeInsets.all(0),
                          dense: true,
                          title: TextWidget(
                            textAlign: TextAlign.start,
                            title: 'Assets with zero value',
                            fontSize: 15.sp,
                            textColor: Colors.white,
                          ),
                          value: showAsset,
                          onChanged: (bool value) {
                            setState(() {
                              showAsset = value;
                            });
                          }),
                    ],
                  ),
                ),
                SizedBox(
                  height: 4.h,
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
                      title: 'Apply',
                      textColor: AppColors.teal,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                SizedBox(
                  height: 6.h,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  StatefulBuilder addAssetsMethod() {
    return StatefulBuilder(
      builder: (BuildContext context,
          StateSetter setState /*You can rename this!*/) {
        return Container(
          decoration: const BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
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
                  title: 'Add Asset',
                  textColor: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 18.sp,
                ),
                SizedBox(
                  height: 4.h,
                ),
                RoundedContainer(
                  radius: 20,
                  containerColor: AppColors.gray3,
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
                  height: 6.h,
                ),
                SizedBox(
                  height: 60.h,
                  child: ListView.builder(
                      itemBuilder: (context, index) {
                        return SwitchListTile.adaptive(
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
                            value: () {
                              switch (index) {
                                case 0:
                                  return addIslam;
                                case 1:
                                  return addEtherum;
                                case 2:
                                  return addBircoin;
                                case 3:
                                  return addCaizcoin;
                                default:
                                  return false;
                              }
                            }(),
                            onChanged: (bool value) {
                              setState(() {
                                switch (index) {
                                  case 0:
                                    addIslam = value;
                                    break;
                                  case 1:
                                    addEtherum = value;
                                    break;
                                  case 2:
                                    addBircoin = value;
                                    break;
                                  case 3:
                                    addCaizcoin = value;
                                    break;
                                }
                              });
                            });
                      },
                      itemCount: dummyData.length,
                      shrinkWrap: true),
                ),
              ],
            ),
          ),
        );
      },
    );
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
