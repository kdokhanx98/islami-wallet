import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_wallet/theme/colors.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../models/wallet_info.dart';
import '../../../services/wallets_service.dart';
import '../../../widgets/custom_icon_widget.dart';
import '../../../widgets/rounded_container.dart';
import '../../../widgets/text_form.dart';
import '../../../widgets/text_widget.dart';

class WalletDetailsPage extends StatefulWidget {
  const WalletDetailsPage(this.wallet, {Key? key}) : super(key: key);

  final WalletInfo wallet;
  @override
  State<WalletDetailsPage> createState() => _WalletDetailsPageState();
}

class _WalletDetailsPageState extends State<WalletDetailsPage> {
  final _nameController = TextEditingController();
  bool isPhraseVisible = false;
  late WalletsService service;
  List<String> words = [];

  @override
  void initState() {
    super.initState();
    service = Provider.of<WalletsService>(context, listen: false);
    _nameController.text = widget.wallet.name;
    words = widget.wallet.mnemonic.split(' ');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
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
                            // onTap: () => context.router.pop<bool>(true),
                          ),
                          TextWidget(
                            title: 'Wallet',
                            // title: 'Swap',
                            textColor: Colors.white,
                            fontSize: 16.sp,
                          ),
                          InkWell(
                            onTap: saveWallet,
                            child: TextWidget(
                              title: 'Save',
                              // title: 'Swap',
                              textColor: AppColors.teal,
                              fontSize: 16.sp,
                            ),
                          )
                        ]),
                    SizedBox(height: 4.h),
                    RoundedContainer(
                      containerColor: AppColors.gray3,
                      border: Border.all(color: AppColors.gray4),
                      width: double.infinity,
                      radius: 15,
                      // padding: EdgeInsets.all(1.w),
                      child: TextForm(
                          title: 'Name',
                          controller: _nameController,
                          textAlign: TextAlign.left),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    words.isEmpty
                        ? Container()
                        : RoundedContainer(
                            onTap: () => setState(() => isPhraseVisible = true),
                            containerColor: AppColors.gray3,
                            border: !isPhraseVisible
                                ? Border.all(color: AppColors.gray4)
                                : null,
                            width: double.infinity,
                            radius: 20,
                            padding: EdgeInsets.all(4.w),
                            child: Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 1.h),
                                  child: GridView.count(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 2.h,
                                    childAspectRatio: 0.5.w,
                                    mainAxisSpacing: 2.h,
                                    shrinkWrap: true,
                                    children:
                                        List.generate(words.length, (index) {
                                      return RoundedContainer(
                                        containerColor: AppColors.primaryColor,
                                        radius: 15,
                                        child: Center(
                                          child: TextWidget(
                                            title:
                                                '${index + 1}. ${words[index]} ',
                                            textColor: Colors.white,
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                ),
                                if (!isPhraseVisible)
                                  Positioned.fill(
                                      child: RoundedContainer(
                                    child: ClipRRect(
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                          sigmaX: 5,
                                          sigmaY: 5,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                                'assets/svg/ic_not_visible.svg'),
                                            SizedBox(
                                              height: 4.h,
                                            ),
                                            TextWidget(
                                              title:
                                                  'Tap to reveal your seed phrase',
                                              textColor: Colors.white,
                                              fontSize: 17.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            TextWidget(
                                              title:
                                                  'Make sure no one is watching your screen.',
                                              textColor: Colors.white,
                                              fontSize: 12.sp,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )),
                              ],
                            ),
                          ),
                    SizedBox(
                      height: 4.h,
                    ),
                    InkWell(
                      onTap: () async {
                        await Clipboard.setData(
                            ClipboardData(text: widget.wallet.mnemonic));

                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('✓   Copied to Clipboard')));
                      },
                      child: Center(
                          child: TextWidget(
                        title: 'Copy phrase',
                        textColor: AppColors.teal,
                        fontSize: 16.sp,
                      )),
                    ),
                  ],
                ))));
  }

  Future<void> saveWallet() async {
    // print('wallet Saved !');

    if (widget.wallet.name != _nameController.text) {
      var myWallets = await service.load();
      var wallet = myWallets.all
          .singleWhere((x) => x.mnemonic == widget.wallet.mnemonic);
      wallet.name = _nameController.text;
      if (wallet.isDefault) {
        myWallets.current!.name = _nameController.text;
      }
      await service.save(myWallets);
    }
  }
}
