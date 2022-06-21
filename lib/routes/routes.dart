// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:islami_wallet/screens/dashboard/bottom_nav.dart';
import 'package:islami_wallet/screens/dashboard/notifications/notifications_screen.dart';
import 'package:islami_wallet/screens/dashboard/projects/projects_screen.dart';
import 'package:islami_wallet/screens/dashboard/settings/settings_screen.dart';
import 'package:islami_wallet/screens/dashboard/transfers/transfers_screen.dart';
import 'package:islami_wallet/screens/dashboard/wallet/view_coin_screen.dart';
import 'package:islami_wallet/screens/dashboard/wallet/wallet_screen.dart';
import 'package:islami_wallet/screens/onboarding/have_wallet_screen.dart';
import 'package:islami_wallet/screens/onboarding/intro_screen.dart';
import 'package:islami_wallet/screens/onboarding/new_wallet_screens/create_new_wallet_screen.dart';
import 'package:islami_wallet/screens/onboarding/new_wallet_screens/passcode_screen.dart';
import 'package:islami_wallet/screens/onboarding/new_wallet_screens/re_enter_passcode_screen.dart';
import 'package:islami_wallet/screens/onboarding/new_wallet_screens/verify_recovery_screen.dart';

import '../screens/dashboard/wallet/scanning_screen.dart';
import '../screens/onboarding/new_wallet_screens/recovery_phrase_screen.dart';

part 'routes.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    // login routes
    AutoRoute(page: IntroPage, initial: true, name: 'IntroRoute', path: '/'),
    AutoRoute(
        page: HaveWalletPage, name: 'HaveWalletRoute', path: '/have-wallet'),
    AutoRoute(page: PasscodePage, name: 'PasscodeRoute', path: '/passcode'),
    AutoRoute(
        page: ReenterPasscodePage,
        name: 'ReenterPasscodeRoute',
        path: '/reenter-passcode'),
    AutoRoute(
        page: CreateNewWalletPage,
        name: 'CreateNewWalletRoute',
        path: '/create-new-wallet'),
    AutoRoute(
        page: RecoveryPhrasePage,
        name: 'RecoveryPhraseRoute',
        path: '/recovery-phrase'),
    AutoRoute(
        page: VerifyRecoveryPage,
        name: 'VerifyRecoveryRoute',
        path: '/verify-recovery'),
    // bottom nav routes
    AutoRoute(
        page: BottomNavigationPage,
        initial: true,
        name: 'BottomNavigationRoute',
        path: '/bottomNavigationScreen',
        children: [
          AutoRoute(
            path: 'wallet-page',
            name: 'WalletRoute',
            page: EmptyRouterPage,
            children: [
              AutoRoute(
                page: WalletPage,
                initial: true,
                path: '',
                name: 'WalletPageRoute',
              ),
              AutoRoute(
                page: ViewCoinPage,
                path: 'view-coin',
                name: 'ViewCoinRoute',
              ),
            ],
          ),
          AutoRoute(
            page: TransfersPage,
            path: 'transfers',
            name: 'TransfersRoute',
          ),
          AutoRoute(
            page: ProjectsPage,
            path: 'projects',
            name: 'ProjectsRoute',
          ),
          AutoRoute(
            page: SettingsPage,
            path: 'settings',
            name: 'SettingsRoute',
          ),
          AutoRoute(
            page: NotificationsPage,
            path: 'notifications',
            name: 'NotificationsRoute',
          ),
        ]),
    AutoRoute(
      page: QRScanningPage,
      path: 'qr-scanning-page',
      name: 'QRScanningRoute',
    ),
  ],
)
class $AppRouter {}
