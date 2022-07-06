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
import 'package:islami_wallet/screens/dashboard/wallet/lock_tokens_screen.dart';
import 'package:islami_wallet/screens/dashboard/wallet/network_fee_screen.dart';
import 'package:islami_wallet/screens/dashboard/wallet/send_assets_confirm.dart';
import 'package:islami_wallet/screens/dashboard/wallet/send_assets_screen.dart';
import 'package:islami_wallet/screens/dashboard/wallet/send_enter_amount_screen.dart';
import 'package:islami_wallet/screens/dashboard/wallet/view_coin_screen.dart';
import 'package:islami_wallet/screens/dashboard/wallet/wallet_screen.dart';
import 'package:islami_wallet/screens/onboarding/have_wallet_screen.dart';
import 'package:islami_wallet/screens/onboarding/intro_screen.dart';
import 'package:islami_wallet/screens/onboarding/new_wallet_screens/create_new_wallet_screen.dart';
import 'package:islami_wallet/screens/onboarding/new_wallet_screens/passcode_screen.dart';
import 'package:islami_wallet/screens/onboarding/new_wallet_screens/re_enter_passcode_screen.dart';
import 'package:islami_wallet/screens/onboarding/new_wallet_screens/verify_recovery_screen.dart';

import '../models/wallet_info.dart';
import '../screens/dashboard/transfers/transfer_fill_screen.dart';
import '../screens/dashboard/wallet/enter_amount_screen.dart';
import '../screens/dashboard/wallet/scanning_screen.dart';
import '../screens/dashboard/wallet/wallet_details_screen.dart';
import '../screens/dashboard/wallet/wallet_list_screen.dart';
import '../screens/onboarding/new_wallet_screens/recovery_phrase_screen.dart';
import '../screens/trust_wallet_demo/demo_screen.dart';
import 'get_initial_route_guard.dart';

part 'routes.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    // bottom nav routes
    AutoRoute(
        page: BottomNavigationPage,
        initial: true,
        guards: [GetInitialRoute],
        name: 'BottomNavigationRoute',
        path: '/',
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
              page: EmptyRouterPage, // SettingsPage,
              path: 'settings',
              name: 'SettingsRoute',
              children: [
                AutoRoute(
                  page: SettingsPage,
                  initial: true,
                  path: '',
                  name: 'SettingsPageRoute',
                ),
                AutoRoute(
                  page: WalletListPage,
                  // initial: true,
                  path: 'wallets',
                  name: 'WalletListRoute',
                ),
                AutoRoute<WalletInfo>(
                  page: WalletDetailsPage,
                  // initial: true,
                  path: 'wallet-details',
                  name: 'WalletDetailsRoute',
                ),
              ]),
          AutoRoute(
            page: NotificationsPage,
            path: 'notifications',
            name: 'NotificationsRoute',
          ),
        ]),
    // login routes
    AutoRoute(
        page: IntroPage,
        guards: [GetInitialRoute],
        name: 'IntroRoute',
        path: '/intro'),
    AutoRoute(
        page: HaveWalletPage, name: 'HaveWalletRoute', path: '/have-wallet'),
    AutoRoute(page: PasscodePage, name: 'PasscodeRoute', path: '/passcode'),
    AutoRoute(page: DemoWalletPage, name: 'DemoWalletRoute', path: '/demo'),
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
    AutoRoute(
      page: QRScanningPage,
      path: 'qr-scanning-page',
      name: 'QRScanningRoute',
    ),
    AutoRoute(
      page: TranferFillPage,
      path: 'transfer-fill-page',
      name: 'TransferFillRoute',
    ),
    AutoRoute(
      page: EnterAmountPage,
      path: 'enter-amount-page',
      name: 'EnterAmountRoute',
    ),
    AutoRoute(
      page: SendEnterAmountPage,
      path: 'send-enter-amount-page',
      name: 'SendEnterAmountRoute',
    ),
    AutoRoute(
      page: SendAssetsPage,
      path: 'send-assets-page',
      name: 'SendAssetsRoute',
    ),
    AutoRoute(
      page: SendAssetsConfirmPage,
      path: 'send-assets-confirm-page',
      name: 'SendAssetsConfirmRoute',
    ),
    AutoRoute(
      page: NetworkFeePage,
      path: 'network-fee-page',
      name: 'NetworkFeeRoute',
    ),
    AutoRoute(
      page: LockTokensPage,
      path: 'lock-tokens-page',
      name: 'LockTokensRoute',
    ),
  ],
)
class AppRouter extends _$AppRouter {
  AppRouter({required super.getInitialRoute});
}
