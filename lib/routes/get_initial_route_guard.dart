import 'package:auto_route/auto_route.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/configuration_service.dart';
import 'routes.dart';

/// An auto_route guard object that routes the user to our landing page if
/// signed in and to the home page if not signed in
class GetInitialRoute extends AutoRouteGuard {
  @override
  Future<void> onNavigation(
      NavigationResolver resolver, StackRouter router) async {
    
    final SharedPreferences _preferences =
        await SharedPreferences.getInstance();
    var didSetupWallet = _preferences.getBool('didSetupWallet') ?? false;

    if (didSetupWallet) {
      //  router.push(const BottomNavigationRoute());
      resolver.next(true);
    } else {
      // if we already have a logged in user, we push them to our home page
      router.push(const IntroRoute());
    }

    // Here we check if the user is logged in using FirebaseAuth (not currentUser -->
    // not logged in)
    // if (FirebaseAuth.instance.currentUser == null) {
    // if we do not have a user yet, we resume navigation to the sign in page
    // with path: '/'
  }
}
