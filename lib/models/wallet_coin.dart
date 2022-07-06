import 'package:fl_chart/src/chart/base/axis_chart/axis_chart_data.dart';

class WalletCoin {
  late String symbol;
  late String name;
  String? network;
  String? contractAddress;
  int? decimals;
  String? coinId;
  String? logo;
  double? price;
  double? priceChangePercentage24h;
  double? moveAmount;
  double? movePercent;
  List<FlSpot>? sparkline;

  WalletCoin(this.symbol, this.name,
      {this.network,
      this.contractAddress,
      this.decimals,
      this.coinId,
      this.logo,
      this.price,
      this.priceChangePercentage24h,
      this.moveAmount,
      this.movePercent,
      this.sparkline});

  WalletCoin.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    symbol = json["symbol"];
    network = json["network"];
    contractAddress = json["contractAddress"];
    decimals = json["decimals"];
    coinId = json["coinId"];
    logo = json["logo"];
  }

  Map<String, dynamic> toJson() => {
        "coinId": coinId,
        "name": name,
        "symbol": symbol,
        "network": network,
        "contractAddress": contractAddress,
        "decimals": decimals,
        "logo": logo,
      };
}
