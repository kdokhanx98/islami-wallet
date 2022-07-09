import 'package:flutter_trust_wallet_core/flutter_trust_wallet_core.dart';
import 'package:islami_wallet/models/wallet_info.dart';

class MyWallets {
  WalletInfo? current;
  List<WalletInfo> all = [];

  MyWallets() {}

  MyWallets.fromJson(Map<String, dynamic> json) {
    current =
        json["current"] == null ? null : WalletInfo.fromJson(json["current"]);
    all = json["all"] == null
        ? []
        : (json["all"] as List).map((e) => WalletInfo.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() => {
        "current": current,
        "all": all.map((v) => v.toJson()).toList(),
      };

  bool exists(String mnemonic) {
    var exists = all.any((w) => w.mnemonic == mnemonic);
    return exists;
  }

  void add(WalletInfo wallet) {
    if (!exists(wallet.mnemonic)) {
      all.add(wallet);
    }
  }
}
