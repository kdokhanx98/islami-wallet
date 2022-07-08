// [
//   {
//     "token_address": "0x784cb74865fde16039aca9f42bf998cf3c15319d",
//     "name": "BitKanz",
//     "symbol": "BTK",
//     "logo": null,
//     "thumbnail": null,
//     "decimals": 18,
//     "balance": "999895998999990000000000"
//   }
// ]

import 'package:web3dart/web3dart.dart';

class MoralisTokenBalance {
  String address = '';
  String name = '';
  String symbol = '';
  int? decimals;
  String? logo;
  String? thumbnail;
  String blockNumber = '';
  EtherAmount balance = EtherAmount.zero();

// ignore: public_member_api_docs, sort_constructors_first
  MoralisTokenBalance.fromJson(Map<String, dynamic> json) {
    address = json['token_address'].toString();
    name = json['name'].toString();
    symbol = json['symbol'] as String;
    decimals = json['decimals'] == null ? null : json['decimals'] as int;
    logo = json['logo'];
    thumbnail = json['thumbnail'];

    BigInt number = BigInt.from(double.parse(json["balance"]));
    balance = EtherAmount.fromUnitAndValue(EtherUnit.wei, number);
  }
}
