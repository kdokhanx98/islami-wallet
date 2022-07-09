import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:islami_wallet/models/wallet_info.dart';
import 'package:islami_wallet/screens/dashboard/settings/preferences_screen.dart';
import 'package:islami_wallet/widgets/settings_item.dart';
import 'package:islami_wallet/widgets/text_widget.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../routes/routes.dart';
import '../../../services/wallets_service.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);
  @override
  State<SettingsPage> createState() => __SettingsPageState();
}

class __SettingsPageState extends State<SettingsPage> {
  WalletInfo? wallet;

  getWallet() async {
    final service = Provider.of<WalletsService>(context, listen: false);
    var wallets = await service.load();
    setState(() {
      wallet = wallets.current;
    });
  }

  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
  );

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
    getWallet();
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  Widget _infoTile(String title, String subtitle) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle.isEmpty ? 'Not set' : subtitle),
    );
  }

  void _launchUrl(url) async {
    if (!await launchUrl(Uri(path: url, scheme: 'https'))) {
      throw 'Could not launch $url';
    }
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
              SettingsItem(
                svgIconName: 'ic_security',
                title: 'Security',
                onTap: () {
                  context.router.push(const SecurityPageRoute());
                },
              ),
              SizedBox(
                height: 1.5.h,
              ),
              SettingsItem(
                svgIconName: 'ic_notifications',
                title: 'Notifications',
                onTap: () {
                  context.router.push(const NotificationSettingsRoute());
                },
              ),
              SizedBox(
                height: 1.5.h,
              ),
              SettingsItem(
                svgIconName: 'ic_preferences',
                title: 'Preferences',
                onTap: () {
                  context.router.push(const PreferencesRoute());
                },
              ),
              SizedBox(
                height: 4.h,
              ),
              // const SettingsItem(
              //   svgIconName: 'ic_walletconnect',
              //   title: 'Walletconnect',
              // ),
              SizedBox(
                height: 4.h,
              ),
              const TextWidget(title: 'Social Media'),
              SizedBox(
                height: 1.5.h,
              ),
              SettingsItem(
                svgIconName: 'ic_instagram',
                title: 'Instagram',
                onTap: () {
                  _launchUrl('instagram.com/islamicoin/');
                },
              ),
              SizedBox(
                height: 1.5.h,
              ),
              SettingsItem(
                svgIconName: 'ic_twitter',
                title: 'Twitter',
                onTap: () {
                  _launchUrl('twitter.com/islamicoin');
                },
              ),
              SizedBox(
                height: 1.5.h,
              ),
              SettingsItem(
                svgIconName: 'ic_facebook',
                title: 'Facebook',
                onTap: () {
                  _launchUrl('facebook.com/islamicoin/');
                },
              ),
              SizedBox(
                height: 1.5.h,
              ),
              SettingsItem(
                svgIconName: 'ic_github',
                title: 'Github',
                onTap: () {
                  _launchUrl('github.com/ISLAMIBLOCKCHAIN/ISLAMICOIN');
                },
              ),
              SizedBox(
                height: 4.h,
              ),
              const TextWidget(title: 'About'),
              SizedBox(
                height: 1.5.h,
              ),
              SettingsItem(
                svgIconName: 'ic_privacy_policy',
                title: 'Privacy Policy',
                onTap: () {
                  _launchUrl('islamicoin.finance/privacy-policy/');
                },
              ),
              SizedBox(
                height: 1.5.h,
              ),
              SettingsItem(
                svgIconName: 'ic_terms',
                title: 'Terms Of Service',
                onTap: () {
                  _launchUrl('islamicoin.finance/terms-and-conditions/');
                },
              ),
              SizedBox(
                height: 1.5.h,
              ),
              SettingsItem(
                svgIconName: 'ic_version',
                title: 'Version',
                subtitle: _packageInfo.version,
                isArrowShown: false,
              ),
              // SizedBox(
              //   height: 1.5.h,
              // ),
              // SettingsItem(
              //   svgIconName: 'ic_fail',
              //   title: 'Demo Wallet',
              //   // subtitle: '1.1',
              //   isArrowShown: false,
              //   onTap: () => context.router.push(const DemoWalletRoute()),
              // ),
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
