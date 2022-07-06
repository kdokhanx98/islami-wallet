import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

import '../models/coin.dart';

class CoinsService {
  // Load coins from this path:
  // https://github.com/ISLAMIBLOCKCHAIN/ISLAMIwallet/blob/main/coinList.json

  static Future<List<Coin>> load() async {
    var coinsString =
        await rootBundle.loadString('assets/coinList.json', cache: true);
    final coinsJson = jsonDecode(coinsString);

    var coins = List<Coin>.from(coinsJson.map((x) => Coin.fromJson(x)));

    return coins;
  }
}
