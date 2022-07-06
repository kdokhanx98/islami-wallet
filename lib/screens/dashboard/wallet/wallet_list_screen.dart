import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_wallet/routes/routes.dart';
import 'package:islami_wallet/theme/colors.dart';
import 'package:islami_wallet/widgets/rounded_container.dart';
import 'package:sizer/sizer.dart';

import '../../../models/wallet_info.dart';
import '../../../widgets/custom_icon_widget.dart';
import '../../../widgets/text_widget.dart';

class WalletListPage extends StatefulWidget {
  const WalletListPage({Key? key}) : super(key: key);

  @override
  State<WalletListPage> createState() => _WalletListPageState();
}

class _WalletListPageState extends State<WalletListPage> {
  List<WalletInfo> wallets = [];

  @override
  void initState() {
    super.initState();
    load();
  }

  load() async {
    wallets = await loadWallets();
    setState(() {
      // redraw
    });
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomIconWidget(
                    svgName: 'ic_back',
                    // onTap: () => context.router.push(const QRScanningRoute()),
                  ),
                  CustomIconWidget(
                    svgName: 'ic_add',
                    onTap: () {
                      context.router.push(const CreateNewWalletRoute());
                      // showModalBottomSheet<String>(
                      //     isScrollControlled: true,
                      //     useRootNavigator: true,
                      //     backgroundColor: Colors.transparent,
                      //     context: context,
                      //     builder: (BuildContext context) {
                      //       return FractionallySizedBox(
                      //           heightFactor: 0.90, child: addAssetsMethod());
                      //     });
                    },
                  ),
                ],
              ),
              SizedBox(height: 4.h),
              TextWidget(
                title: 'Wallets',
                // title: 'Swap',
                textColor: Colors.white,
                fontSize: 19.sp,
              ),
              SizedBox(
                height: 4.h,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    child: Column(
                      children: [
                        MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          child: ListView.builder(
                            physics: const ClampingScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return buildWallet(
                                  context, index, wallets[index]);
                            },
                            itemCount: wallets.length,
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      )),
    );
  }

  Widget buildWallet(BuildContext context, int index, WalletInfo wallet) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 2.w),
        child: RoundedContainer(
            // onTap: () => context.router.push(const TransferFillRoute()),
            width: double.infinity,
            containerColor: AppColors.gray4,
            radius: 20,
            padding: EdgeInsets.all(4.w),
            child: ListTile(
              // horizontalTitleGap: 1.6.w,
              leading: Container(
                padding: EdgeInsets.all(3.w),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        wallet.isDefault ? AppColors.orange2 : AppColors.gray),
                child: SvgPicture.asset('assets/svg/ic_wallet.svg',
                    color: wallet.isDefault
                        ? AppColors.primaryColor
                        : AppColors.gray7),
              ),
              title: Padding(
                padding: EdgeInsets.only(bottom: 1.h),
                child: TextWidget(
                  title: wallet.name,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  textColor: Colors.white,
                ),
              ),
              subtitle: RichText(
                textAlign: TextAlign.start,
                maxLines: 1,
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: "Wallet subtitle ",
                        style: TextStyle(
                          color: AppColors.gray,
                          fontSize: 12.sp,
                        )),
                    // TextSpan(
                    //   text: subtitlePercentage,
                    //   style: TextStyle(
                    //     fontSize: 11.sp,
                    //     color: () {
                    //       if (subtitlePercentage.contains('-')) {
                    //         return AppColors.red2;
                    //       } else {
                    //         return AppColors.green2;
                    //       }
                    //     }(),
                    //   ),
                    // ),
                  ],
                ),
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Icon(Icons.info_outline_rounded, color: AppColors.gray),
                  // TextWidget(
                  //   title: trailingTitle,
                  //   textColor: Colors.white,
                  //   fontWeight: FontWeight.bold,
                  //   maxLines: 1,
                  // ),
                  // SizedBox(
                  //   height: 1.h,
                  // ),
                  // TextWidget(
                  //   maxLines: 1,
                  //   title: trailingSubtitle,
                  // ),
                ],
              ),
            )));
  }

  Future<List<WalletInfo>> loadWallets() async {
    return Future.delayed(const Duration(seconds: 1), () {
      var list = <WalletInfo>[];
      list.add(WalletInfo("Main", "mnemonic", isDefault: true));
      list.add(WalletInfo("Isalmi Wallet", "mnemonic 2"));
      list.add(WalletInfo("BTK 1", "mnemonic 3"));

      return list;
    });
  }
}
