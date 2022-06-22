import 'dart:ui';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_wallet/routes/routes.dart';
import 'package:islami_wallet/widgets/settings_item.dart';
import 'package:sizer/sizer.dart';

import '../../theme/colors.dart';
import '../../widgets/rounded_container.dart';
import '../../widgets/text_widget.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({Key? key}) : super(key: key);

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  int bottomNavDefaultIndex = 0;

  final iconList = <String>[
    'ic_wallet',
    'ic_transfers',
    'ic_bottom_logo',
    'ic_notification',
    'ic_settings',
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AutoTabsScaffold(
        extendBody: true,
        animationCurve: Curves.decelerate,
        animationDuration: Duration.zero,
        inheritNavigatorObservers: false,
        routes: const [
          WalletRoute(),
          TransfersRoute(),
          ProjectsRoute(),
          NotificationsRoute(),
          SettingsRoute(),
        ],
        bottomNavigationBuilder: (_, tabsRouter) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 100),
              child: AnimatedBottomNavigationBar.builder(
                notchSmoothness: NotchSmoothness.smoothEdge,
                safeAreaValues: const SafeAreaValues(bottom: false),
                height: 100,
                backgroundColor: AppColors.primaryColor.withOpacity(0.5),
                onTap: (index) {
                  if (index != 2) {
                    setState(() {
                      bottomNavDefaultIndex = index;
                    });

                    tabsRouter.setActiveIndex(bottomNavDefaultIndex);
                  }
                  if (index == 2) {
                    showModalBottomSheet<String>(
                        isScrollControlled: true,
                        useRootNavigator: true,
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (BuildContext context) {
                          return FractionallySizedBox(
                              heightFactor: 0.90, child: islamiProjects());
                        });
                  }
                },
                itemCount: iconList.length,
                activeIndex: bottomNavDefaultIndex,
                borderColor: AppColors.gray4,
                splashSpeedInMilliseconds: 0,
                leftCornerRadius: 20,
                rightCornerRadius: 20,
                splashRadius: 0,
                gapLocation: GapLocation.none,
                tabBuilder: (index, isActive) {
                  bool isMiddleTab = index == 2;

                  Color? iconColor =
                      isActive ? AppColors.teal : AppColors.gray6;
                  iconColor = isMiddleTab ? null : iconColor;
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: isMiddleTab
                            ? size.height >= 900
                                ? 2.h
                                : 2.5.h
                            : size.height >= 900
                                ? 4.h
                                : 4.5.h),
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isMiddleTab ? AppColors.primaryColor : null),
                      padding: EdgeInsets.all(isMiddleTab ? 2.w : 0),
                      child: SvgPicture.asset(
                        "assets/svg/${iconList[index]}.svg",
                        color: iconColor,
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        });
  }

  StatefulBuilder islamiProjects() {
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
                  title: 'ISLAMIBLOCKCHAIN\nProjects',
                  textColor: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 18.sp,
                ),
                SizedBox(
                  height: 2.h,
                ),
                const TextWidget(
                    title: 'Invest in places that matter to you the most!'),
                SizedBox(
                  height: 4.h,
                ),
                SizedBox(
                  height: 65.h,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SettingsItem(
                          svgIconName: 'ic_project_coin',
                          title: 'ISLAMICOIN',
                          containerColor: AppColors.primaryColor,
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        const SettingsItem(
                          svgIconName: 'ic_project_media',
                          title: 'ISLAMedia',
                          containerColor: AppColors.primaryColor,
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        const SettingsItem(
                          svgIconName: 'ic_project_game',
                          title: 'ISLAMIgame',
                          containerColor: AppColors.primaryColor,
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        const SettingsItem(
                          svgIconName: 'ic_project_mall',
                          title: 'ISLAMImall',
                          containerColor: AppColors.primaryColor,
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        const SettingsItem(
                          svgIconName: 'ic_project_metaverse',
                          title: 'ISLAMImetaverse',
                          containerColor: AppColors.primaryColor,
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        const SettingsItem(
                          svgIconName: 'ic_project_blockchain',
                          title: 'ISLAMIBLOCKCHAIN',
                          containerColor: AppColors.primaryColor,
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        const SettingsItem(
                          svgIconName: 'ic_project_gift',
                          title: 'BAIT AL MAL',
                          containerColor: AppColors.primaryColor,
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        const SettingsItem(
                          svgIconName: 'ic_project_paper',
                          title: 'white paper',
                          containerColor: AppColors.primaryColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
