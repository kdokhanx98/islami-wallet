import 'dart:ui';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_wallet/routes/routes.dart';
import 'package:sizer/sizer.dart';

import '../../theme/colors.dart';

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
                  setState(() {
                    bottomNavDefaultIndex = index;
                  });
                  tabsRouter.setActiveIndex(bottomNavDefaultIndex);
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
                        vertical: isMiddleTab ? 2.5.h : 4.7.h),
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
}
