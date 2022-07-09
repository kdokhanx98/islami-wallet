import 'package:fl_chart/src/chart/base/axis_chart/axis_chart_data.dart';
import 'package:islami_wallet/models/coin.dart';

import '../services/utilities.dart';

class WalletCoin {
  late String symbol;
  late String name;
  String? network;
  String? contractAddress;
  int? decimals;
  String? coinId;
  String? logo;
  double tokens = 0.0;
  double price = 0.0;
  double priceChangePercentage24h = 0.0;
  double moveAmount = 0.0;
  double movePercent = 0.0;
  List<FlSpot>? sparkline;

  WalletCoin(this.symbol, this.name,
      {this.network,
      this.contractAddress,
      this.decimals,
      this.coinId,
      this.logo,
      this.tokens = 0.0,
      this.price = 0.0,
      this.priceChangePercentage24h = 0.0,
      this.moveAmount = 0.0,
      this.movePercent = 0.0,
      this.sparkline});

  WalletCoin.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    symbol = json["symbol"];
    network = json["network"];
    contractAddress = json["contractAddress"];
    decimals = json["decimals"];
    coinId = json["coinId"];
    logo = json["logo"];
    tokens = json["tokens"] ?? 0.0;
    price = json["price"] ?? 0.0;
    priceChangePercentage24h = json["priceChangePercentage24h"] ?? 0.0;
    moveAmount = json["moveAmount"] ?? 0.0;
    movePercent = json["movePercent"] ?? 0.0;
  }

  Map<String, dynamic> toJson() => {
        "coinId": coinId,
        "name": name,
        "symbol": symbol,
        "network": network,
        "contractAddress": contractAddress,
        "decimals": decimals,
        "logo": logo,
        "tokens": tokens,
        "price": price,
        "priceChangePercentage24h": priceChangePercentage24h,
        "moveAmount": moveAmount,
        "movePercent": movePercent,
      };

  static WalletCoin map(Coin coin) {
    var wc = WalletCoin(coin.symbol, coin.name);
    wc.logo = coin.logo;
    wc.decimals = coin.decimals;
    wc.contractAddress = coin.id;
    wc.network = coin.type;
    wc.tokens = 0.0;
    wc.price = 0.0;
    wc.priceChangePercentage24h = 0.0;
    wc.moveAmount = 0.0;
    wc.movePercent = 0.0;

    return wc;
  }

  // int getResolution() {
  //   if (price <= 100 && price > 1) {
  //     return 2;
  //   } else if (price <= 1 && price > 0.01) {
  //     return 4;
  //   } else if (price <= 0.01 && price > 0.0001) {
  //     return 6;
  //   } else if (price <= 0.0001 && price > 0.0) {
  //     return decimals ?? 10;
  //   }
  //   return 1;
  // }

  getChain({test = false}) {
    var chain = "bsc";
    if (network == "coin") {
      if (symbol.toLowerCase() == "matic") {
        chain = test ? "mumbai" : "polygon";
      }
    } else if (network == "POLYGON") {
      chain = test ? "mumbai" : "polygon";
    }
    return chain;
  }

  displayTokens() {
    return '${_formatTokens(tokens)} $symbol';
  }

  String getBalance() {
    var total = price * tokens;

    if (total > 1000) {
      return '\$ ${Utilities.formatter.format(total)}';
    } else {
      var resolution = Utilities.getResolution(total);
      return '\$ ${total.toStringAsFixed(resolution)}';
    }
  }

  String formatPrice() {
    var formatted = '\$0.0';
    if (price > 1000) {
      formatted = '\$' + Utilities.formatter.format(price);
    } else {
      var resolution = Utilities.getResolution(price);
      formatted = '\$' + price.toStringAsFixed(resolution);
    }
    return formatted;
  }

  _formatTokens(double value) {
    if (value > 1000) {
      return Utilities.formatter.format(value);
    } else {
      var resolution = Utilities.getResolution(value);
      return value.toStringAsFixed(resolution);
    }
  }
}
