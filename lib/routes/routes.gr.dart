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
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(IntroRoute.name, path: '/'),
        RouteConfig(HaveWalletRoute.name, path: '/have-wallet'),
        RouteConfig(PasscodeRoute.name, path: '/passcode'),
        RouteConfig(ReenterPasscodeRoute.name, path: '/reenter-passcode'),
        RouteConfig(CreateNewWalletRoute.name, path: '/create-new-wallet'),
        RouteConfig(RecoveryPhraseRoute.name, path: '/recovery-phrase')
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
