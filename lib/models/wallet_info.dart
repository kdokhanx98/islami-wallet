import 'wallet_coin.dart';

class WalletInfo {
  String name = '';
  String mnemonic = '';
  List<WalletCoin>? coins;
  bool isDefault = false;

  WalletInfo(this.name, this.mnemonic, {this.coins, this.isDefault = false});

  WalletInfo.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    mnemonic = json["mnemonic"];
    isDefault = json["is_default"];
    coins = json["coins"] == null
        ? null
        : (json["coins"] as List).map((e) => WalletCoin.fromJson(e)).toList();

    // if (json['coins'] != null) {
    //   coins = <WalletCoin>[];
    //   json['coins'].forEach((v) {
    //     coins!.add(WalletCoin.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "mnemonic": mnemonic,
        "coins": coins?.map((v) => v.toJson()).toList(),
        "is_default": isDefault
      };
}
