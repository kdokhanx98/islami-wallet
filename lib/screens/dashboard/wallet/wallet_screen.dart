import 'dart:developer';
import 'dart:math' as math;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_wallet/config/constants.dart';
import 'package:islami_wallet/models/wallet_info.dart';
import 'package:islami_wallet/routes/routes.dart';
import 'package:islami_wallet/services/coins_service.dart';
import 'package:islami_wallet/theme/colors.dart';
import 'package:islami_wallet/widgets/coin_image.dart';
import 'package:islami_wallet/widgets/rounded_container.dart';
import 'package:islami_wallet/widgets/text_widget.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sizer/sizer.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import '../../../models/coin.dart';
import '../../../models/wallet_coin.dart';
import '../../../services/coinmarketcap_service.dart';
import '../../../services/moralis_service.dart';
import '../../../services/utilities.dart';
import '../../../services/wallets_service.dart';
import '../../../widgets/asset_item_widget.dart';
import '../../../widgets/custom_icon_widget.dart';
import '../../../widgets/receive_assets_widget.dart';
import '../../../widgets/text_limited_widget.dart';

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
  late IMoralisService moralis;

  // List<Map<String, dynamic>> dummyData = [
  //   {
  //     'title': 'IslamiCoin',
  //     'subtitle': '\$0.002336',
  //     'subtitlePercentage': '(-14.38%)',
  //     'trailingTitle': '12060 ISLAMI',
  //     'trailingSubtitle': '\$28.17216',
  //     'svgPathName': 'ic_islami',
  //     'iconContainerColor': AppColors.orange,
  //     'iconCode': 'ISLAMI',
  //   },
  //   {
  //     'title': 'Ethereum',
  //     'subtitle': '\$1,983.71',
  //     'subtitlePercentage': '(-0.70%)',
  //     'trailingTitle': '1.56 ETH',
  //     'trailingSubtitle': '\$3094.5876',
  //     'svgPathName': 'ic_ethereum',
  //     'iconContainerColor': Colors.black,
  //     'iconCode': 'ETH',
  //   },
  //   {
  //     'title': 'Bitcoin',
  //     'subtitle': '\$29,777.21',
  //     'subtitlePercentage': '(+1.37%)',
  //     'trailingTitle': '0.0123 BTC',
  //     'trailingSubtitle': '\$366.26',
  //     'svgPathName': 'ic_bitcoin',
  //     'iconContainerColor': AppColors.orange2,
  //     'iconCode': 'BTC',
  //   },
  //   {
  //     'title': 'CAIZCOIN',
  //     'subtitle': '\$2.7663',
  //     'subtitlePercentage': '(-3.03%)',
  //     'trailingTitle': '219 CAZ',
  //     'trailingSubtitle': '\$605.82',
  //     'svgPathName': 'ic_caizcoin',
  //     'iconContainerColor': AppColors.darkGreen2,
  //     'iconCode': 'CAZ',
  //   },
  // ];
  List<Coin> coins = [];
  late WalletsService service;
  WalletInfo? wallet;
  String walletName = '';

  bool isLoading = true;

  WalletCoin? selectedCoin;

  String publicAddress = '';

  @override
  void initState() {
    super.initState();
    service = Provider.of<WalletsService>(context, listen: false);
    moralis = MoralisService();

    loadCoins();
    loadCurrentWallet();
    syncWalletPrices();
  }

  loadCoins() async {
    coins = await CoinsService.load();
    // print(coins);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
            padding:
                EdgeInsets.only(top: 2.w, left: 5.w, right: 5.w, bottom: 0.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisSize: MainAxisSize.max,
              children: [
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
                            }).whenComplete(() {
                          syncWalletPrices();
                          setState(() {
                            // redraw
                          });
                        });
                        ;
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Center(
                  child: TextWidget(
                    title: 'Current Balance - $walletName',
                    fontSize: 15.sp,
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Center(
                  child: TextWidget(
                    title: getTotalBalance(),
                    fontSize: 35.sp,
                    textColor: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                // Center(
                //   child: RoundedContainer(
                //     onTap: () {
                //       // copy the wallet.
                //       log('walled was copied');
                //     },
                //     radius: 50,
                //     containerColor: AppColors.primaryColor,
                //     padding: EdgeInsets.only(top: 1.w, bottom: 1.w, right: 2.w),
                //     child: Row(
                //       mainAxisSize: MainAxisSize.min,
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         const TextWidget(
                //           title: '15rGLE…hsMKYP',
                //           textColor: Colors.white,
                //         ),
                //         SvgPicture.asset(
                //           'assets/svg/ic_copy.svg',
                //           height: 3.5.h,
                //         )
                //       ],
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 4.h,
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    walletAction(
                        svgIconName: 'ic_send',
                        title: 'Send',
                        onTap: () {
                          showModalBottomSheet<String>(
                              isScrollControlled: true,
                              useRootNavigator: true,
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (BuildContext context) {
                                return FractionallySizedBox(
                                    heightFactor: 0.90,
                                    child: selectAssetsMethod('send'));
                              });
                        }),
                    // walletAction(
                    //     svgIconName: 'ic_add',
                    //     title: 'Buy',
                    //     onTap: () {
                    //       log('buy clicked');
                    //     },
                    //     containerColor: AppColors.teal),
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
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
              ],
            ),
          ),
        ),
        isLoading
            ? Expanded(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircularProgressIndicator.adaptive(
                    backgroundColor: AppColors.teal,
                  )
                ],
              ))
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: SizedBox(
                    height: 48.h,
                    child: SingleChildScrollView(
                      // physics: const ClampingScrollPhysics(),
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
                          if (wallet == null)
                            const CircularProgressIndicator.adaptive()
                          else if (wallet!.coins == null ||
                              wallet!.coins!.isEmpty)
                            Column(
                              children: [
                                const TextWidget(
                                    title:
                                        "Please select coins to display here."),
                                TextButton(
                                    onPressed: () {
                                      showModalBottomSheet<String>(
                                          isScrollControlled: true,
                                          useRootNavigator: true,
                                          backgroundColor: Colors.transparent,
                                          context: context,
                                          builder: (BuildContext context) {
                                            return FractionallySizedBox(
                                                heightFactor: 0.90,
                                                child: addAssetsMethod());
                                          }).whenComplete(() {
                                        syncWalletPrices();
                                        setState(() {
                                          // redraw
                                        });
                                      });
                                    },
                                    child: const Text(
                                      'Start Here !',
                                      style: TextStyle(color: AppColors.teal),
                                    ))
                              ],
                            )
                          else
                            MediaQuery.removePadding(
                              context: context,
                              removeTop: true,
                              child: ListView.builder(
                                physics: const ClampingScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return AssetItemWidget(
                                      itemImage: wallet!.coins![index].logo,
                                      svgPathName: 'N/A',
                                      // dummyData[index]['svgPathName'] ?? 'N/A',
                                      iconContainerColor:
                                          // dummyData[index]
                                          //         ['iconContainerColor'] ??
                                          AppColors.gray3,
                                      title: wallet!.coins![index].name,
                                      // dummyData[index]['title'] ?? 'N/A',
                                      subtitle:
                                          wallet!.coins![index].formatPrice(),
                                      // dummyData[index]['subtitle'] ?? 'N/A',
                                      subtitlePercentage: wallet!.coins![index]
                                          .priceChangePercentage24h
                                          .toStringAsFixed(2),
                                      //  dummyData[index]
                                      //         ['subtitlePercentage'] ??
                                      //     'N/A',
                                      trailingTitle:
                                          '${wallet!.coins![index].displayTokens()}',
                                      // dummyData[index]['trailingTitle'] ?? 'N/A',
                                      trailingSubtitle:
                                          wallet!.coins![index].getBalance(),
                                      // dummyData[index]['trailingSubtitle'] ?? 'N/A',
                                      index: index,
                                      coin: wallet!.coins![index]);
                                },
                                itemCount:
                                    wallet!.coins!.length, // dummyData.length,
                              ),
                            ),
                        ],
                      ),
                    ))),
      ],
    )));
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
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      // color: dummyData[index]
                                      //     ['iconContainerColor']
                                    ),
                                    child: CoinImage(image: coins[index].logo),
                                    // SvgPicture.asset(
                                    //   'assets/svg/${dummyData[index]['svgPathName']}.svg',
                                    //   width: 24,
                                    //   height: 24,
                                    // ),
                                  ),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  TextWidget(
                                    textAlign: TextAlign.start,
                                    title: coins[index]
                                        .name, // dummyData[index]['title'],
                                    fontSize: 15.sp,
                                    textColor: Colors.white,
                                  ),
                                ],
                              ),
                              value: () {
                                // return if wallet coin matches
                                return walletHasCoin(coins[index]);
                                // switch (index) {
                                //   case 0:
                                //     return addIslam;
                                //   case 1:
                                //     return addEtherum;
                                //   case 2:
                                //     return addBircoin;
                                //   case 3:
                                //     return addCaizcoin;
                                //   default:
                                //     return false;
                                // }
                              }(),
                              onChanged: (bool value) {
                                // add/remove wallet coins
                                setWalletCoin(coins[index], value);
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
                        itemCount: coins.length,
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
                            onTap: () async {
                              selectedCoin = wallet!.coins![index];
                              publicAddress = await service
                                      .getPublicAddress(selectedCoin!) ??
                                  '';
                              switch (method) {
                                case 'receive':
                                  context.router.pop().then(
                                      (value) => showModalBottomSheet<String>(
                                          isScrollControlled: true,
                                          useRootNavigator: true,
                                          backgroundColor: Colors.transparent,
                                          context: context,
                                          builder: (BuildContext context) {
                                            return FractionallySizedBox(
                                                heightFactor: 0.90,
                                                child: ReceiveAssets(
                                                    selectedCoin!,
                                                    publicAddress));
                                          }));
                                  break;
                                case 'send':
                                  context.router.pop().then((value) =>
                                      context.router.push(SendAssetsRoute(
                                          coin: selectedCoin!)));
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
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.gray3
                                      // dummyData[index]
                                      //     ['iconContainerColor']
                                      ),
                                  child: CoinImage(
                                      image: wallet!.coins![index].logo),
                                  // SvgPicture.asset(
                                  //   'assets/svg/${dummyData[index]['svgPathName']}.svg',
                                  //   width: 24,
                                  //   height: 24,
                                  // ),
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                TextWidget(
                                  textAlign: TextAlign.start,
                                  title: wallet!.coins![index]
                                      .name, // dummyData[index]['title'],
                                  fontSize: 15.sp,
                                  textColor: Colors.white,
                                ),
                              ],
                            ),
                            trailing: TextWidget(
                              title: wallet!.coins![index]
                                  .symbol, // (dummyData[index]['iconCode'] ?? 'N/A'),
                              textColor: Colors.white,
                            ),
                          );
                        },
                        itemCount: wallet!.coins!.length, //dummyData.length,
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

  Future<void> loadCurrentWallet() async {
    var myWallets = await service.load();
    wallet = myWallets.current;
    setState(() {
      walletName = wallet == null ? '' : wallet!.name;
      isLoading = false;
    });
  }

  Future<void> syncWalletPrices() async {
    var myWallets = await service.load();
    wallet = myWallets.current;

    var symbols = wallet!.coins == null
        ? ""
        : wallet!.coins!.map((e) => e.symbol.toUpperCase()).join(",");
    try {
      var coinMarketCapCoins = await CoinMarketCap.getCoins(symbols: symbols);
      if (wallet!.coins != null && coinMarketCapCoins.isNotEmpty) {
        for (var c in wallet!.coins!) {
          var cmc = coinMarketCapCoins.firstWhere(
              (e) => e.symbol.toLowerCase() == c.symbol.toLowerCase());
          c.price = cmc.price;
          c.priceChangePercentage24h = cmc.priceChangePercentage24h;
          var chain = c.getChain(test: Constants.IS_TESTING);

          // var address = '0xD6F88E70D479f5247B51E219638B7c144F1A9747';
          var address = await service.getPublicAddressOfWallet(c, wallet!);

          // var address = trustWallet!.getExtendedPublicKey(purpose, coinType, twHdVersion)
          if (address == null) {
            return;
          }
          if (c.network == "coin") {
            var balance = await moralis.getNativeBalance(chain, address);
            c.tokens = balance.getInWei.toDouble() / math.pow(10, c.decimals!);
          } else {
            var tokenBalances = await moralis
                .getTokenBalance(chain, address, <String>[c.contractAddress!]);
            c.tokens = tokenBalances.isEmpty
                ? 0
                : tokenBalances.single.balance.getInWei.toDouble() /
                    math.pow(10, c.decimals!);
          }
          // print(c.tokens);
        }
      }
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'X An error occured, please check your connection and retry. If the problem persists, contact technical support !')));
      // copy the wallet.
      log('An error occured, please check your connection and retry');
    }
  }

  bool walletHasCoin(Coin coin) {
    return wallet?.coins == null
        ? false
        : wallet!.coins!
            .any((x) => x.symbol.toLowerCase() == coin.symbol.toLowerCase());
  }

  Future<void> setWalletCoin(Coin coin, bool isSelected) async {
    if (wallet!.coins == null) {
      wallet!.coins = [];
    }
    if (isSelected) {
      // add
      WalletCoin walletCoin = WalletCoin.map(coin);
      wallet!.coins!.add(walletCoin);
    } else {
      // remove
      wallet!.coins!.removeWhere(
          (x) => x.symbol.toLowerCase() == coin.symbol.toLowerCase());
    }
    await service.updateWallet(wallet!);
  }

  String getTotalBalance() {
    var total = 0.0;

    if (wallet != null && wallet!.coins != null) {
      for (var coin in wallet!.coins!) {
        total += coin.price * coin.tokens;
      }
    }
    if (total > 1000) {
      return '\$ ${Utilities.formatter.format(total)}';
    } else {
      var resolution = Utilities.getResolution(total);
      return '\$ ${total.toStringAsFixed(resolution)}';
    }
  }
}
