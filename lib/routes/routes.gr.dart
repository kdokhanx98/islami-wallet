// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'routes.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter(
      {GlobalKey<NavigatorState>? navigatorKey, required this.getInitialRoute})
      : super(navigatorKey);

  final GetInitialRoute getInitialRoute;

  @override
  final Map<String, PageFactory> pagesMap = {
    BottomNavigationRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const BottomNavigationPage());
    },
    IntroRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const IntroPage());
    },
    HaveWalletRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const HaveWalletPage());
    },
    PasscodeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const PasscodePage());
    },
    DemoWalletRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const DemoWalletPage());
    },
    ReenterPasscodeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ReenterPasscodePage());
    },
    CreateNewWalletRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const CreateNewWalletPage());
    },
    RecoveryPhraseRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const RecoveryPhrasePage());
    },
    VerifyRecoveryRoute.name: (routeData) {
      final args = routeData.argsAs<VerifyRecoveryRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: VerifyRecoveryPage(key: args.key, mnemonic: args.mnemonic));
    },
    QRScanningRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const QRScanningPage());
    },
    TransferFillRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const TranferFillPage());
    },
    EnterAmountRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const EnterAmountPage());
    },
    SendEnterAmountRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SendEnterAmountPage());
    },
    SendAssetsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SendAssetsPage());
    },
    SendAssetsConfirmRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SendAssetsConfirmPage());
    },
    NetworkFeeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const NetworkFeePage());
    },
    LockTokensRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const LockTokensPage());
    },
    WalletRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const EmptyRouterPage());
    },
    TransfersRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const TransfersPage());
    },
    ProjectsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ProjectsPage());
    },
    SettingsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const EmptyRouterPage());
    },
    NotificationsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const NotificationsPage());
    },
    WalletPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const WalletPage());
    },
    ViewCoinRoute.name: (routeData) {
      final args = routeData.argsAs<ViewCoinRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: ViewCoinPage(key: args.key, index: args.index));
    },
    SettingsPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SettingsPage());
    },
    WalletListRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const WalletListPage());
    },
    WalletDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<WalletDetailsRouteArgs>();
      return MaterialPageX<WalletInfo>(
          routeData: routeData,
          child: WalletDetailsPage(args.wallet, key: args.key));
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(BottomNavigationRoute.name, path: '/', guards: [
          getInitialRoute
        ], children: [
          RouteConfig(WalletRoute.name,
              path: 'wallet-page',
              parent: BottomNavigationRoute.name,
              children: [
                RouteConfig(WalletPageRoute.name,
                    path: '', parent: WalletRoute.name),
                RouteConfig(ViewCoinRoute.name,
                    path: 'view-coin', parent: WalletRoute.name)
              ]),
          RouteConfig(TransfersRoute.name,
              path: 'transfers', parent: BottomNavigationRoute.name),
          RouteConfig(ProjectsRoute.name,
              path: 'projects', parent: BottomNavigationRoute.name),
          RouteConfig(SettingsRoute.name,
              path: 'settings',
              parent: BottomNavigationRoute.name,
              children: [
                RouteConfig(SettingsPageRoute.name,
                    path: '', parent: SettingsRoute.name),
                RouteConfig(WalletListRoute.name,
                    path: 'wallets', parent: SettingsRoute.name),
                RouteConfig(WalletDetailsRoute.name,
                    path: 'wallet-details', parent: SettingsRoute.name)
              ]),
          RouteConfig(NotificationsRoute.name,
              path: 'notifications', parent: BottomNavigationRoute.name)
        ]),
        RouteConfig(IntroRoute.name, path: '/intro', guards: [getInitialRoute]),
        RouteConfig(HaveWalletRoute.name, path: '/have-wallet'),
        RouteConfig(PasscodeRoute.name, path: '/passcode'),
        RouteConfig(DemoWalletRoute.name, path: '/demo'),
        RouteConfig(ReenterPasscodeRoute.name, path: '/reenter-passcode'),
        RouteConfig(CreateNewWalletRoute.name, path: '/create-new-wallet'),
        RouteConfig(RecoveryPhraseRoute.name, path: '/recovery-phrase'),
        RouteConfig(VerifyRecoveryRoute.name, path: '/verify-recovery'),
        RouteConfig(QRScanningRoute.name, path: 'qr-scanning-page'),
        RouteConfig(TransferFillRoute.name, path: 'transfer-fill-page'),
        RouteConfig(EnterAmountRoute.name, path: 'enter-amount-page'),
        RouteConfig(SendEnterAmountRoute.name, path: 'send-enter-amount-page'),
        RouteConfig(SendAssetsRoute.name, path: 'send-assets-page'),
        RouteConfig(SendAssetsConfirmRoute.name,
            path: 'send-assets-confirm-page'),
        RouteConfig(NetworkFeeRoute.name, path: 'network-fee-page'),
        RouteConfig(LockTokensRoute.name, path: 'lock-tokens-page')
      ];
}

/// generated route for
/// [BottomNavigationPage]
class BottomNavigationRoute extends PageRouteInfo<void> {
  const BottomNavigationRoute({List<PageRouteInfo>? children})
      : super(BottomNavigationRoute.name, path: '/', initialChildren: children);

  static const String name = 'BottomNavigationRoute';
}

/// generated route for
/// [IntroPage]
class IntroRoute extends PageRouteInfo<void> {
  const IntroRoute() : super(IntroRoute.name, path: '/intro');

  static const String name = 'IntroRoute';
}

/// generated route for
/// [HaveWalletPage]
class HaveWalletRoute extends PageRouteInfo<void> {
  const HaveWalletRoute() : super(HaveWalletRoute.name, path: '/have-wallet');

  static const String name = 'HaveWalletRoute';
}

/// generated route for
/// [PasscodePage]
class PasscodeRoute extends PageRouteInfo<void> {
  const PasscodeRoute() : super(PasscodeRoute.name, path: '/passcode');

  static const String name = 'PasscodeRoute';
}

/// generated route for
/// [DemoWalletPage]
class DemoWalletRoute extends PageRouteInfo<void> {
  const DemoWalletRoute() : super(DemoWalletRoute.name, path: '/demo');

  static const String name = 'DemoWalletRoute';
}

/// generated route for
/// [ReenterPasscodePage]
class ReenterPasscodeRoute extends PageRouteInfo<void> {
  const ReenterPasscodeRoute()
      : super(ReenterPasscodeRoute.name, path: '/reenter-passcode');

  static const String name = 'ReenterPasscodeRoute';
}

/// generated route for
/// [CreateNewWalletPage]
class CreateNewWalletRoute extends PageRouteInfo<void> {
  const CreateNewWalletRoute()
      : super(CreateNewWalletRoute.name, path: '/create-new-wallet');

  static const String name = 'CreateNewWalletRoute';
}

/// generated route for
/// [RecoveryPhrasePage]
class RecoveryPhraseRoute extends PageRouteInfo<void> {
  const RecoveryPhraseRoute()
      : super(RecoveryPhraseRoute.name, path: '/recovery-phrase');

  static const String name = 'RecoveryPhraseRoute';
}

/// generated route for
/// [VerifyRecoveryPage]
class VerifyRecoveryRoute extends PageRouteInfo<VerifyRecoveryRouteArgs> {
  VerifyRecoveryRoute({Key? key, required String mnemonic})
      : super(VerifyRecoveryRoute.name,
            path: '/verify-recovery',
            args: VerifyRecoveryRouteArgs(key: key, mnemonic: mnemonic));

  static const String name = 'VerifyRecoveryRoute';
}

class VerifyRecoveryRouteArgs {
  const VerifyRecoveryRouteArgs({this.key, required this.mnemonic});

  final Key? key;

  final String mnemonic;

  @override
  String toString() {
    return 'VerifyRecoveryRouteArgs{key: $key, mnemonic: $mnemonic}';
  }
}

/// generated route for
/// [QRScanningPage]
class QRScanningRoute extends PageRouteInfo<void> {
  const QRScanningRoute()
      : super(QRScanningRoute.name, path: 'qr-scanning-page');

  static const String name = 'QRScanningRoute';
}

/// generated route for
/// [TranferFillPage]
class TransferFillRoute extends PageRouteInfo<void> {
  const TransferFillRoute()
      : super(TransferFillRoute.name, path: 'transfer-fill-page');

  static const String name = 'TransferFillRoute';
}

/// generated route for
/// [EnterAmountPage]
class EnterAmountRoute extends PageRouteInfo<void> {
  const EnterAmountRoute()
      : super(EnterAmountRoute.name, path: 'enter-amount-page');

  static const String name = 'EnterAmountRoute';
}

/// generated route for
/// [SendEnterAmountPage]
class SendEnterAmountRoute extends PageRouteInfo<void> {
  const SendEnterAmountRoute()
      : super(SendEnterAmountRoute.name, path: 'send-enter-amount-page');

  static const String name = 'SendEnterAmountRoute';
}

/// generated route for
/// [SendAssetsPage]
class SendAssetsRoute extends PageRouteInfo<void> {
  const SendAssetsRoute()
      : super(SendAssetsRoute.name, path: 'send-assets-page');

  static const String name = 'SendAssetsRoute';
}

/// generated route for
/// [SendAssetsConfirmPage]
class SendAssetsConfirmRoute extends PageRouteInfo<void> {
  const SendAssetsConfirmRoute()
      : super(SendAssetsConfirmRoute.name, path: 'send-assets-confirm-page');

  static const String name = 'SendAssetsConfirmRoute';
}

/// generated route for
/// [NetworkFeePage]
class NetworkFeeRoute extends PageRouteInfo<void> {
  const NetworkFeeRoute()
      : super(NetworkFeeRoute.name, path: 'network-fee-page');

  static const String name = 'NetworkFeeRoute';
}

/// generated route for
/// [LockTokensPage]
class LockTokensRoute extends PageRouteInfo<void> {
  const LockTokensRoute()
      : super(LockTokensRoute.name, path: 'lock-tokens-page');

  static const String name = 'LockTokensRoute';
}

/// generated route for
/// [EmptyRouterPage]
class WalletRoute extends PageRouteInfo<void> {
  const WalletRoute({List<PageRouteInfo>? children})
      : super(WalletRoute.name, path: 'wallet-page', initialChildren: children);

  static const String name = 'WalletRoute';
}

/// generated route for
/// [TransfersPage]
class TransfersRoute extends PageRouteInfo<void> {
  const TransfersRoute() : super(TransfersRoute.name, path: 'transfers');

  static const String name = 'TransfersRoute';
}

/// generated route for
/// [ProjectsPage]
class ProjectsRoute extends PageRouteInfo<void> {
  const ProjectsRoute() : super(ProjectsRoute.name, path: 'projects');

  static const String name = 'ProjectsRoute';
}

/// generated route for
/// [EmptyRouterPage]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(SettingsRoute.name, path: 'settings', initialChildren: children);

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [NotificationsPage]
class NotificationsRoute extends PageRouteInfo<void> {
  const NotificationsRoute()
      : super(NotificationsRoute.name, path: 'notifications');

  static const String name = 'NotificationsRoute';
}

/// generated route for
/// [WalletPage]
class WalletPageRoute extends PageRouteInfo<void> {
  const WalletPageRoute() : super(WalletPageRoute.name, path: '');

  static const String name = 'WalletPageRoute';
}

/// generated route for
/// [ViewCoinPage]
class ViewCoinRoute extends PageRouteInfo<ViewCoinRouteArgs> {
  ViewCoinRoute({Key? key, required int index})
      : super(ViewCoinRoute.name,
            path: 'view-coin', args: ViewCoinRouteArgs(key: key, index: index));

  static const String name = 'ViewCoinRoute';
}

class ViewCoinRouteArgs {
  const ViewCoinRouteArgs({this.key, required this.index});

  final Key? key;

  final int index;

  @override
  String toString() {
    return 'ViewCoinRouteArgs{key: $key, index: $index}';
  }
}

/// generated route for
/// [SettingsPage]
class SettingsPageRoute extends PageRouteInfo<void> {
  const SettingsPageRoute() : super(SettingsPageRoute.name, path: '');

  static const String name = 'SettingsPageRoute';
}

/// generated route for
/// [WalletListPage]
class WalletListRoute extends PageRouteInfo<void> {
  const WalletListRoute() : super(WalletListRoute.name, path: 'wallets');

  static const String name = 'WalletListRoute';
}

/// generated route for
/// [WalletDetailsPage]
class WalletDetailsRoute extends PageRouteInfo<WalletDetailsRouteArgs> {
  WalletDetailsRoute({required WalletInfo wallet, Key? key})
      : super(WalletDetailsRoute.name,
            path: 'wallet-details',
            args: WalletDetailsRouteArgs(wallet: wallet, key: key));

  static const String name = 'WalletDetailsRoute';
}

class WalletDetailsRouteArgs {
  const WalletDetailsRouteArgs({required this.wallet, this.key});

  final WalletInfo wallet;

  final Key? key;

  @override
  String toString() {
    return 'WalletDetailsRouteArgs{wallet: $wallet, key: $key}';
  }
}
