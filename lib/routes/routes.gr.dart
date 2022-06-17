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
    MainRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const EmptyRouterPage());
    },
    HomePageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const MainPage());
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
              RouteConfig(MainRoute.name,
                  path: 'main-page',
                  parent: BottomNavigationRoute.name,
                  children: [
                    RouteConfig(HomePageRoute.name,
                        path: '', parent: MainRoute.name)
                  ])
            ])
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
/// [EmptyRouterPage]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(MainRoute.name, path: 'main-page', initialChildren: children);

  static const String name = 'MainRoute';
}

/// generated route for
/// [MainPage]
class HomePageRoute extends PageRouteInfo<void> {
  const HomePageRoute() : super(HomePageRoute.name, path: '');

  static const String name = 'HomePageRoute';
}
