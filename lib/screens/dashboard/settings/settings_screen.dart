import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:islami_wallet/models/wallet_info.dart';
import 'package:islami_wallet/widgets/settings_item.dart';
import 'package:islami_wallet/widgets/text_widget.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../routes/routes.dart';
import '../../../services/wallets_service.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  WalletInfo? wallet;

  @override
  void initState() {
    super.initState();
    getWallet();
  }

  getWallet() async {
    final service = Provider.of<WalletsService>(context, listen: false);
    var wallets = await service.load();
    setState(() {
      wallet = wallets.current;
    });
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
              TextWidget(
                title: 'Settings',
                textColor: Colors.white,
                fontSize: 19.sp,
              ),
              SizedBox(
                height: 4.h,
              ),
              SettingsItem(
                  svgIconName: 'ic_settings_wallet',
                  title: 'Wallets',
                  subtitle: wallet == null ? '' : wallet!.name,
                  onTap: () {
                    // print('going to wallets !');
                    context.router.push(const WalletListRoute());
                  }),
              SizedBox(height: 4.h),
              const SettingsItem(
                svgIconName: 'ic_security',
                title: 'Security',
              ),
              SizedBox(
                height: 1.5.h,
              ),
              const SettingsItem(
                svgIconName: 'ic_notifications',
                title: 'Notifications',
              ),
              SizedBox(
                height: 1.5.h,
              ),
              const SettingsItem(
                svgIconName: 'ic_preferences',
                title: 'Preferences',
              ),
              SizedBox(
                height: 4.h,
              ),
              const SettingsItem(
                svgIconName: 'ic_walletconnect',
                title: 'Walletconnect',
              ),
              SizedBox(
                height: 4.h,
              ),
              const TextWidget(title: 'Social Media'),
              SizedBox(
                height: 1.5.h,
              ),
              const SettingsItem(
                svgIconName: 'ic_instagram',
                title: 'Instagram',
              ),
              SizedBox(
                height: 1.5.h,
              ),
              const SettingsItem(
                svgIconName: 'ic_twitter',
                title: 'Twitter',
              ),
              SizedBox(
                height: 1.5.h,
              ),
              const SettingsItem(
                svgIconName: 'ic_facebook',
                title: 'Facebook',
              ),
              SizedBox(
                height: 1.5.h,
              ),
              const SettingsItem(
                svgIconName: 'ic_github',
                title: 'Github',
              ),
              SizedBox(
                height: 4.h,
              ),
              const TextWidget(title: 'About'),
              SizedBox(
                height: 1.5.h,
              ),
              const SettingsItem(
                svgIconName: 'ic_privacy_policy',
                title: 'Privacy Policy',
              ),
              SizedBox(
                height: 1.5.h,
              ),
              const SettingsItem(
                svgIconName: 'ic_terms',
                title: 'Terms Of Service',
              ),
              SizedBox(
                height: 1.5.h,
              ),
              const SettingsItem(
                svgIconName: 'ic_version',
                title: 'Version',
                subtitle: '1.1',
                isArrowShown: false,
              ),
              SizedBox(
                height: 1.5.h,
              ),
              SettingsItem(
                svgIconName: 'ic_fail',
                title: 'Demo Wallet',
                // subtitle: '1.1',
                isArrowShown: false,
                onTap: () => context.router.push(const DemoWalletRoute()),
              ),
              SizedBox(
                height: 4.h,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
