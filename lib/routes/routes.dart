// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:islami_wallet/screens/onboarding/have_wallet_screen.dart';
import 'package:islami_wallet/screens/onboarding/intro_screen.dart';
import 'package:islami_wallet/screens/onboarding/new_wallet_screens/create_new_wallet_screen.dart';
import 'package:islami_wallet/screens/onboarding/new_wallet_screens/passcode_screen.dart';
import 'package:islami_wallet/screens/onboarding/new_wallet_screens/re_enter_passcode_screen.dart';

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
    // bottom nav routes
    // AutoRoute(
    //     page: BottomNavigationScreen,
    //     initial: true,
    //     name: 'BottomNavigationRoute',
    //     path: '/bottomNavigationScreen',
    //     children: [
    //       AutoRoute(
    //         path: 'histoy',
    //         name: 'HistoryRoute',
    //         page: EmptyRouterPage,
    //         children: [
    //           AutoRoute(
    //             path: '',
    //             initial: true,
    //             name: 'HistoryPageRoute',
    //             page: HisrtoyPage,
    //           ),
    //         ],
    //       ),
    //       AutoRoute(
    //         path: 'gallery',
    //         name: 'GalleryRoute',
    //         page: GalleryPage,
    //       ),
    //       AutoRoute(
    //         path: 'prfile',
    //         name: 'ProfileRoute',
    //         page: ProfilePage,
    //       ),
    //       AutoRoute(
    //         path: 'settings',
    //         initial: true,
    //         name: 'SettingsRoute',
    //         page: SettingsPage,
    //       ),
    //       AutoRoute(
    //           page: HeroEmptyRouterPage,
    //           path: 'home',
    //           name: 'HomeRoute',
    //           children: [
    //             AutoRoute(
    //               page: HomePage,
    //               initial: true,
    //               path: '',
    //               name: 'HomePageRoute',
    //             ),
    //             CustomRoute(
    //                 page: CalendarPage,
    //                 path: 'calendar',
    //                 name: 'CalendarRoute',
    //                 durationInMilliseconds: 700,
    //                 transitionsBuilder: TransitionsBuilders.fadeIn,
    //                 reverseDurationInMilliseconds: 700),
    //           ]),
    //     ]),
  ],
)
class $AppRouter {}
