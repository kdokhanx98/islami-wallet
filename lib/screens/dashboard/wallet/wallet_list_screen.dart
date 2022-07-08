import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_wallet/routes/routes.dart';
import 'package:islami_wallet/theme/colors.dart';
import 'package:islami_wallet/widgets/rounded_container.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../models/wallet_info.dart';
import '../../../services/wallets_service.dart';
import '../../../widgets/custom_icon_widget.dart';
import '../../../widgets/text_widget.dart';

class WalletListPage extends StatefulWidget {
  const WalletListPage({Key? key}) : super(key: key);

  @override
  State<WalletListPage> createState() => _WalletListPageState();
}

class _WalletListPageState extends State<WalletListPage> {
  List<WalletInfo> wallets = [];
  bool loading = true;
  late WalletsService service;

  @override
  void initState() {
    super.initState();
    service = Provider.of<WalletsService>(context, listen: false);
    load();
  }

  load() async {
    wallets = await loadWallets();
    setState(() {
      loading = false;
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
                  ),
                  CustomIconWidget(
                    svgName: 'ic_add',
                    onTap: () {
                      context.router.push(const IntroRoute());
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
                  child: loading
                      ? const CircularProgressIndicator.adaptive(
                          backgroundColor: AppColors.teal,
                        )
                      : SingleChildScrollView(
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
    return Dismissible(
        // Each Dismissible must contain a Key. Keys allow Flutter to
        // uniquely identify widgets.
        key: Key(wallet.name),
        confirmDismiss: confirmDismiss,
        // Provide a function that tells the app
        // what to do after an item has been swiped away.
        onDismissed: (direction) async {
          // Remove the item from the data source.
          var deleted = wallets[index];
          await service.delete(deleted);

          setState(() {
            wallets.removeAt(index);
          });

          // Then show a snackbar.
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('${wallet.name} wallet deleted')));
        },
        // Show a red background as the item is swiped away.
        background: Padding(
            padding: EdgeInsets.symmetric(vertical: 2.w),
            child: RoundedContainer(
              width: double.infinity,
              containerColor: AppColors.red2,
              radius: 20,
              padding: EdgeInsets.all(4.w),
            )),
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 2.w),
            child: RoundedContainer(
                onTap: () async {
                  wallets.forEach((x) {
                    x.isDefault = false;
                  });
                  await service.setCurrent(wallets[index]);
                  // setState(() {});
                  // print(
                  //     'set as default wallet and navigate to wallet screen and show coins and balances ');
                  context.router.push(const BottomNavigationRoute());
                },
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
                        color: wallet.isDefault
                            ? AppColors.orange2
                            : AppColors.gray),
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
                            text: "Multi-chain Wallet",
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
                      IconButton(
                        onPressed: () async {
                          // print(
                          //     'Goto wallet details screen, show name and secret phrase !');
                          context.router
                              .push(WalletDetailsRoute(wallet: wallet));
                        },
                        icon: const Icon(Icons.info_outline_rounded,
                            color: AppColors.gray),
                      )
                    ],
                  ),
                ))));
  }

  Future<List<WalletInfo>> loadWallets() async {
    // return Future.delayed(const Duration(seconds: 1), () {
    //   var list = <WalletInfo>[];
    //   list.add(WalletInfo("Main",
    //       "off shallow where math tooth test shallow jaguar ecology excess chronic code",
    //       isDefault: true));
    //   list.add(WalletInfo("Isalmi Wallet",
    //       "pitch behave share group aim observe assault glove gap wink mosquito faith"));
    //   list.add(WalletInfo("BTK 1", "mnemonic phrase 3"));

    //   return list;

    var myWallets = await service.load();

    return myWallets.all;
  }

  Future<bool?> confirmDismiss(DismissDirection direction) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm"),
          content: const Text("Are you sure you wish to delete this wallet?"),
          actions: <Widget>[
            FlatButton(
                color: AppColors.red,
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text("DELETE")),
            FlatButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text("CANCEL"),
            ),
          ],
        );
      },
    );
  }
}
