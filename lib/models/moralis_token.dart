// [
//   {
//     "address": "0x2d30ca6f024dbc1307ac8a1a44ca27de6f797ec22ef20627a1307243b0ab7d09",
//     "name": "Kylin Network",
//     "symbol": "KYL",
//     "decimals": "18",
//     "logo": "https://cdn.moralis.io/eth/0x67b6d479c7bb412c54e03dca8e1bc6740ce6b99c.png",
//     "logo_hash": "ee7aa2cdf100649a3521a082116258e862e6971261a39b5cd4e4354fcccbc54d",
//     "thumbnail": "https://cdn.moralis.io/eth/0x67b6d479c7bb412c54e03dca8e1bc6740ce6b99c_thumb.png",
//     "block_number": "string",
//     "validated": "string"
//   }
// ]

class MoralisToken {
  String address = '';
  String name = '';
  String symbol = '';
  int? decimals;
  String? logo;
  String? logoHash;
  String? thumbnail;
  String blockNumber = '';
  int validated;

// ignore: public_member_api_docs, sort_constructors_first
  MoralisToken.fromJson(Map<String, dynamic> json)
      : address = json['address'].toString(),
        name = json['name'].toString(),
        symbol = json['symbol'] as String,
        decimals =
            json['decimals'] == null ? null : int.parse(json['decimals']),
        logo = json['logo'],
        logoHash = json['logo_hash'],
        thumbnail = json['thumbnail'],
        blockNumber = json['block_number'] as String,
        validated = json['validated'] as int;
}
