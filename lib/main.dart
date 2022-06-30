import 'package:flutter/material.dart';
import 'package:islami_wallet/routes/routes.dart';
import 'package:islami_wallet/theme/colors.dart';
import 'package:sizer/sizer.dart';
import 'package:trust_wallet_core/flutter_trust_wallet_core.dart';

void main() {
  FlutterTrustWalletCore.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp.router(
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        title: 'ISLAMI wallet',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: AppColors.primaryColor,
            unselectedWidgetColor: Colors.white, // <-- your color

            fontFamily: 'Almarai'),
      );
    });
  }
}
