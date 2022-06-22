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

class AppRouter extends RootStackRouter {
  AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
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
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const VerifyRecoveryPage());
    },
    BottomNavigationRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const BottomNavigationPage());
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
          routeData: routeData, child: const SettingsPage());
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
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(IntroRoute.name, path: '/'),
        RouteConfig(HaveWalletRoute.name, path: '/have-wallet'),
        RouteConfig(PasscodeRoute.name, path: '/passcode'),
        RouteConfig(ReenterPasscodeRoute.name, path: '/reenter-passcode'),
        RouteConfig(CreateNewWalletRoute.name, path: '/create-new-wallet'),
        RouteConfig(RecoveryPhraseRoute.name, path: '/recovery-phrase'),
        RouteConfig(VerifyRecoveryRoute.name, path: '/verify-recovery'),
        RouteConfig(BottomNavigationRoute.name,
            path: '/bottomNavigationScreen',
            children: [
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
                  path: 'settings', parent: BottomNavigationRoute.name),
              RouteConfig(NotificationsRoute.name,
                  path: 'notifications', parent: BottomNavigationRoute.name)
            ]),
        RouteConfig(QRScanningRoute.name, path: 'qr-scanning-page'),
        RouteConfig(TransferFillRoute.name, path: 'transfer-fill-page'),
        RouteConfig(EnterAmountRoute.name, path: 'enter-amount-page')
      ];
}

/// generated route for
/// [IntroPage]
class IntroRoute extends PageRouteInfo<void> {
  const IntroRoute() : super(IntroRoute.name, path: '/');

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
class VerifyRecoveryRoute extends PageRouteInfo<void> {
  const VerifyRecoveryRoute()
      : super(VerifyRecoveryRoute.name, path: '/verify-recovery');

  static const String name = 'VerifyRecoveryRoute';
}

/// generated route for
/// [BottomNavigationPage]
class BottomNavigationRoute extends PageRouteInfo<void> {
  const BottomNavigationRoute({List<PageRouteInfo>? children})
      : super(BottomNavigationRoute.name,
            path: '/bottomNavigationScreen', initialChildren: children);

  static const String name = 'BottomNavigationRoute';
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
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: 'settings');

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
