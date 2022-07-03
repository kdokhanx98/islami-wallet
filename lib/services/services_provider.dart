import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'configuration_service.dart';
import 'contract_locator.dart';

Future<List<SingleChildWidget>> createProviders() async {
  final sharedPrefs = await SharedPreferences.getInstance();

  final configurationService = ConfigurationService(sharedPrefs);

  // final addressService = AddressService(configurationService);

  final contractLocator = await ContractLocator.setup();

  // ChangeNotifierProvider(
  //   create: (context) => GoogleSignInProvider(),
  //   child:
  return [
    // Provider.value(value: addressService),
    Provider.value(value: contractLocator),
    Provider.value(value: configurationService),
  ];
}
