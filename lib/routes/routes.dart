// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:islami_wallet/screens/onboarding/intro_screen.dart';

part 'routes.gr.dart';    


@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    // login routes
    AutoRoute(page: IntroPage, initial: true, name: 'IntroRoute', path: '/'),
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
