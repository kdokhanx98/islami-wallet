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
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(IntroRoute.name, path: '/'),
        RouteConfig(HaveWalletRoute.name, path: '/have-wallet'),
        RouteConfig(PasscodeRoute.name, path: '/passcode')
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
