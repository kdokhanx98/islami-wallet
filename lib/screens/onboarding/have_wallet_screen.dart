import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_wallet/theme/colors.dart';
import 'package:islami_wallet/widgets/custom_icon_widget.dart';
import 'package:islami_wallet/widgets/rounded_container.dart';
import 'package:islami_wallet/widgets/text_form.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:trust_wallet_core/flutter_trust_wallet_core.dart';
import '../../routes/routes.dart';
import '../../services/configuration_service.dart';
import '../../widgets/text_widget.dart';

class HaveWalletPage extends StatefulWidget {
  const HaveWalletPage({Key? key}) : super(key: key);

  @override
  State<HaveWalletPage> createState() => _HaveWalletPageState();
}

class _HaveWalletPageState extends State<HaveWalletPage> {
  String text = '';
  final _mnemonicController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _mnemonicController.text = "";
  }

  @override
  void dispose() {
    _mnemonicController.dispose();
    super.dispose();
  }

  _onKeyboardTap(String value) {
    setState(() {
      text = text + value;
    });
    log('text $text');
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
              const CustomIconWidget(svgName: 'ic_back'),
              SizedBox(
                height: 4.h,
              ),
              Center(
                child: TextWidget(
                  title: 'Import Wallet',
                  fontSize: 18.sp,
                  textColor: Colors.white,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              const Center(
                child: TextWidget(
                  title:
                      'Enter the 12 recovery phrase your were given when you created your account',
                ),
              ),
              SizedBox(
                height: 6.h,
              ),
              RoundedContainer(
                containerColor: AppColors.gray3,
                border: Border.all(color: AppColors.gray4),
                width: double.infinity,
                radius: 15,
                padding: EdgeInsets.all(4.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextForm(
                        title: 'Recovery Phrase',
                        controller: _mnemonicController),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        InkWell(
                            onTap: () async {
                              final clipboard =
                                  await Clipboard.getData("text/plain");
                              if (clipboard != null && clipboard.text != null) {
                                print(clipboard.text.toString());
                                _mnemonicController.text =
                                    clipboard.text.toString();
                              }
                            },
                            child: TextWidget(
                              title: 'Paste',
                              textColor: AppColors.teal,
                              fontSize: 16.sp,
                            ))
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              InkWell(
                  onTap: (() => context.router.push(const QRScanningRoute())),
                  child: Center(
                    child: TextWidget(
                      title: 'Or scan the QR code',
                      textColor: AppColors.teal,
                      fontSize: 16.sp,
                    ),
                  )),
              NumericKeyboard(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                onKeyboardTap: _onKeyboardTap,
                textColor: Colors.white,
                rightButtonFn: () {
                  if (text.isNotEmpty) {
                    setState(() {
                      text = text.substring(0, text.length - 1);
                    });
                    log('after delete text $text');
                  }
                },
                rightIcon: const Icon(
                  Icons.backspace_outlined,
                  color: Colors.white,
                ),
                leftButtonFn: () {
                  log('left button clicked');
                },
                leftIcon: Icon(
                  Icons.circle,
                  size: 1.w,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              RoundedContainer(
                onTap: () async {
                  var mnemonic = _mnemonicController.text.trim().toLowerCase();
                  try {
                    var wallet = HDWallet.createWithMnemonic(mnemonic);
                    // store locally
                    final configurationService =
                        Provider.of<ConfigurationService>(context, listen: false);

                    await configurationService.setMnemonic(mnemonic);
                    await configurationService.setPrivateKey(null);
                    await configurationService.setupDone(true);

                    context.router.push(const BottomNavigationRoute());
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Invalid mnemonic phrase !')),
                    );
                  }
                },
                padding: EdgeInsets.symmetric(vertical: 1.5.h),
                radius: 50,
                border: Border.all(
                  color: AppColors.teal,
                ),
                child: Center(
                  child: TextWidget(
                    title: 'Import Wallet',
                    textColor: AppColors.teal,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
