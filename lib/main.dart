import 'package:flutter/material.dart';
import 'package:islami_wallet/routes/routes.dart';
import 'package:islami_wallet/theme/colors.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_trust_wallet_core/flutter_trust_wallet_core.dart';

import 'routes/get_initial_route_guard.dart';
import 'services/services_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterTrustWalletCore.init();
  final stores = await createProviders();

  runApp(MyApp(stores));
}

class MyApp extends StatelessWidget {
  MyApp(this.stores, {Key? key}) : super(key: key);

  final List<SingleChildWidget> stores;

  // This widget is the root of your application.
  final _appRouter = AppRouter(getInitialRoute: GetInitialRoute());

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: stores,
        child: Sizer(builder: (context, orientation, deviceType) {
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
        }));
  }
}
