import 'package:islami_wallet/config/constants.dart';
import 'package:wnetworking/wnetworking.dart';

import '../models/wallet_coin.dart';

class CoinMarketCap {
  static const _apiKey = Constants.API_KEY_COIN_MARKET_CAP;
  static const _url = 'https://pro-api.coinmarketcap.com/v1/cryptocurrency';

  static Future<Iterable<String>> getListingLatest({int limit = 10}) async {
    var url = '$_url/listings/latest?start=1&limit=$limit&convert=USD';
    var result = await HttpReqService.get<JMap>(url,
        auth: AuthType.apiKey,
        authData: const MapEntry('X-CMC_PRO_API_KEY', _apiKey));
    var coins =
        (result?['data'] as List).cast<JMap>().map<String>((e) => e['name']);

    return coins;
  }

  static Future<List<WalletCoin>> getCoins({String symbols = ''}) async {
    var url = '$_url/quotes/latest?convert=USD&symbol=$symbols';
    var result = await HttpReqService.get<JMap>(url,
        auth: AuthType.apiKey,
        authData: const MapEntry('X-CMC_PRO_API_KEY', _apiKey));
    if (result?['status']["error_code"] == 0) {
      var entries = (result?['data'] as JMap)
          .entries
          .map((MapEntry mapEntry) => mapEntry.value)
          .toList();
      var coins = entries.map((e) {
        var wc = WalletCoin(e["symbol"], e["name"]);
        wc.decimals = 0;
        wc.price = e["quote"]["USD"]["price"];
        wc.priceChangePercentage24h = e["quote"]["USD"]["percent_change_24h"];
        wc.moveAmount = 0;
        wc.movePercent = 0;
        wc.network = '';
        wc.contractAddress = '';

        return wc;
      }).toList();

      return coins;
    } else {
      return [];
    }
  }
}
