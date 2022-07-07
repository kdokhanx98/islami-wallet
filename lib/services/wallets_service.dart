import 'dart:convert';

import 'package:islami_wallet/models/my_wallets.dart';
import 'package:islami_wallet/models/wallet_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WalletsService {
  // Load coins from this path:
  // https://github.com/ISLAMIBLOCKCHAIN/ISLAMIwallet/blob/main/coinList.json
  static const String KEY = '_wallets';

  SharedPreferences prefs;

  WalletsService(this.prefs);

  Future<MyWallets> load() async {
    // final prefs = await SharedPreferences.getInstance();

    var walletsString = prefs.getString(KEY);
    if (walletsString == null) return MyWallets();

    final walletsJson = jsonDecode(walletsString);
    final myWallets = MyWallets.fromJson(walletsJson);
    return myWallets;
  }

  Future<void> save(MyWallets myWallets) async {
    final walletsJson = myWallets.toJson();
    final walletsString = jsonEncode(walletsJson);

    // final Future<SharedPreferences> _prefs =await  SharedPreferences.getInstance();
    // final SharedPreferences prefs = await _prefs;
    prefs.setString(KEY, walletsString);

    prefs.setBool('didSetupWallet', (myWallets.current != null));
  }

  Future<void> createWithMnemonic(String mnemonic) async {
    var myWallets = await load();
    var name =
        myWallets.all.isEmpty ? 'main' : 'wallet-${myWallets.all.length + 1}';
    var newWallet =
        WalletInfo(name, mnemonic, isDefault: myWallets.all.isEmpty);
    myWallets.add(newWallet);
    myWallets.current ??= newWallet;

    await save(myWallets);
  }

  Future<bool> hasAWallet() async {
    var myWallets = await load();
    return myWallets.current != null;
  }

  Future<void> setCurrent(WalletInfo wallet) async {
    var myWallets = await load();
    myWallets.all.forEach((x) {
      if (x.mnemonic == wallet.mnemonic) {
        x.isDefault = true;
      } else {
        x.isDefault = false;
      }
    });
    wallet.isDefault = true;
    myWallets.current = wallet;
    await save(myWallets);
  }

  Future<void> delete(WalletInfo wallet) async {
    var myWallets = await load();

    myWallets.all.removeWhere((e) => e.mnemonic == wallet.mnemonic);
    if (myWallets.all.isEmpty) {
      myWallets.current = null;
    } else if (wallet.isDefault) {
      myWallets.current = myWallets.all.first;
      myWallets.current!.isDefault = true;
    }

    await save(myWallets);
  }
}
