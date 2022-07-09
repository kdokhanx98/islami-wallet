import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter_trust_wallet_core/flutter_trust_wallet_core.dart';
import 'package:flutter_trust_wallet_core/trust_wallet_core_ffi.dart';
import 'package:islami_wallet/models/my_wallets.dart';
import 'package:islami_wallet/models/wallet_coin.dart';
import 'package:islami_wallet/models/wallet_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web3dart/web3dart.dart';

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

  Future<WalletInfo?> getCurrent() async {
    var myWallets = await load();
    return myWallets.current;
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

  Future<void> updateWallet(WalletInfo wallet) async {
    var myWallets = await load();

    var match = myWallets.all.firstWhere((e) => e.mnemonic == wallet.mnemonic);

    match.coins = wallet.coins;
    myWallets.current!.coins = wallet.coins;

    await save(myWallets);
  }

  Future<String?> getPublicAddress(WalletCoin coin) async {
    var current = await getCurrent();
    if (current == null) return null;
    return getPublicAddressOfWallet(coin, current);
  }

  String? getPublicAddressOfWallet(WalletCoin coin, WalletInfo wallet) {
    var trustWallet = HDWallet.createWithMnemonic(wallet.mnemonic);
    var coinType = getCoinType(coin);
    var address = trustWallet.getAddressForCoin(coinType);
    return address;
  }

  int getCoinType(WalletCoin coin) {
    var symbol = coin.symbol.toLowerCase();
    var network = coin.network?.toLowerCase();

    if (symbol == "btc") {
      return TWCoinType.TWCoinTypeBitcoin;
    } else if (symbol == "eth" ||
        symbol == "islami" ||
        symbol == "matic" ||
        (symbol == "usdc" && network == "polygon") ||
        (symbol == "usdt" && network == "polygon") ||
        symbol == "islami" ||
        symbol == "wmatic") {
      return TWCoinType.TWCoinTypeEthereum;
    } else if (symbol == "sol") {
      return TWCoinType.TWCoinTypeSolana;
    } else if (symbol == "atom") {
      return TWCoinType.TWCoinTypeCosmos;
    } else if (symbol == "dot") {
      return TWCoinType.TWCoinTypePolkadot;
    } else if (symbol == "avax") {
      return TWCoinType.TWCoinTypeAvalancheCChain;
    } else if (symbol == "doge") {
      return TWCoinType.TWCoinTypeDogecoin;
    }

    return TWCoinType.TWCoinTypeEthereum;
  }

  Future<bool> transfer(
      WalletCoin coin, String toAddress, double amount) async {
    final completer = Completer<bool>();

    var myWallets = await load();
    var wallet = myWallets.current;
    var trustWallet = HDWallet.createWithMnemonic(wallet!.mnemonic);
    var coinType = getCoinType(coin);
    var fromAddress = trustWallet.getAddressForCoin(coinType);
    final privateKey = trustWallet.getKeyForCoin(coinType);
    final network = coin.network;

    BigInt bigAmount = BigInt.from(amount * math.pow(10, coin.decimals!));

    try {
      // await _contractLocator.getInstance(network).send(
      //   privateKey,
      //   EthereumAddress.fromHex(toAddress),
      //   bigAmount,
      //   onTransfer: (from, to, value) {
      //     if (!completer.isCompleted) {
      //       completer.complete(true);
      //     }
      //   },
      //   onError: (ex) {

      //     completer.complete(false);
      //   },
      // );
    } catch (ex) {
      log(ex.toString());

      completer.complete(false);
    }
    // }
    return completer.future;
  }
}
