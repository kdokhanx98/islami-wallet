import 'package:islami_wallet/models/wallet_info.dart';

class MyWallets {
  WalletInfo? current;
  List<WalletInfo> all = [];

  MyWallets() {}

  MyWallets.fromJson(Map<String, dynamic> json) {
    current = json["current"];
    all = json["all"] == null
        ? []
        : (json["all"] as List).map((e) => WalletInfo.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() => {
        "current": current,
        "all": all.map((v) => v.toJson()).toList(),
      };
}
