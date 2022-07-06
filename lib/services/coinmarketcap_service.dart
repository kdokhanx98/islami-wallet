import 'package:wnetworking/wnetworking.dart';


class CoinMarketCap {
  static const _apiKey = '111111111111111111111111111111';
  static const _url = 'https://pro-api.coinmarketcap.com/v1/cryptocurrency';

  static Future<void> getListingLatest(int limit) async {
    var url = '$_url/listings/latest?start=1&limit=$limit&convert=USD';
    var result = await HttpReqService.get<JMap>(
      url, 
      auth: AuthType.apiKey,
      authData: MapEntry('X-CMC_PRO_API_KEY', _apiKey)
    );
    var coins = (result?['data'] as List).cast<JMap>().map<String>((e) => e['name']);
    print(coins);
  }
}