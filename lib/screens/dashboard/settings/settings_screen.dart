import 'package:flutter/material.dart';
import 'package:islami_wallet/widgets/settings_item.dart';
import 'package:islami_wallet/widgets/text_widget.dart';
import 'package:sizer/sizer.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

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
              const SettingsItem(
                svgIconName: 'ic_settings_wallet',
                title: 'Wallets',
                subtitle: 'Wallet Name',
              ),
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
                height: 4.h,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
