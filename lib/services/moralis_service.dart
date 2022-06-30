import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';

import '../config/constants.dart';
import '../models/moralis_token.dart';

abstract class IMoralisService {
  Future<List<MoralisToken>> getMetadataBySymbol(String chain, String symbol);
  Future<List<MoralisToken>> getMetadataByAddress(String chain, String address);

  // https://deep-index.moralis.io/api/v2/0xFB129E16CFb0BAa0857258548E82AFEd04Be12Dc/balance?chain=bsc
  // Response body
  // {
  //   "balance": "10000000000000000"
  // }
  Future<EtherAmount> getNativeBalance(
      String chain, EthereumAddress walletAddress);

  // https://deep-index.moralis.io/api/v2/0x057Ec652A4F150f7FF94f089A38008f49a0DF88e/erc20?chain=eth&token_addresses=0x9c891326Fd8b1a713974f73bb604677E1E63396D
  // https://deep-index.moralis.io/api/v2/0xd6f88e70d479f5247b51e219638b7c144f1a9747/erc20?chain=bsc%20testnet&token_addresses=0x784cb74865fde16039aca9f42bf998cf3c15319d
  // Response body
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
  Future<EtherAmount> getTokenBalance(String chain,
      EthereumAddress walletAddress, List<EthereumAddress> contractAddresses);

  Future<dynamic> getWalletTransactions(
      String chain, EthereumAddress walletAddress);

  Future<dynamic> getNativeTransactions(
      String chain, EthereumAddress walletAddress);
}

class MoralisService implements IMoralisService {
  MoralisService();

  // 	Returns metadata (name, symbol, decimals, logo) for a given token contract address.

  @override
  Future<List<MoralisToken>> getMetadataBySymbol(String chain, String symbol) async {
    // https://deep-index.moralis.io/api/v2/erc20/metadata/symbols?chain=bsc%20testnet&symbols=BTK
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
    List<MoralisToken> result = <MoralisToken>[];    
    try {
      var url =
          '${Constants.API_BASE_URL}/erc20/metadata/symbols?chain=$chain&symbols=$symbol';
      
      var response = await get(Uri.parse(url), headers: {
        'accept': 'application/json',
        'X-API-Key': Constants.API_KEY,
      });
      if (response.statusCode != 200) {
        throw Exception("API error");
      }

      List<dynamic> tokens = jsonDecode(response.body);

      result = tokens.map((value) => MoralisToken.fromJson(value)).toList();
      
      // print(result);
    } catch (e) {
      print(e);
    } finally {
      // client.close();
    }
    return result;
  }

  @override
  Future<List<MoralisToken>> getMetadataByAddress(String chain, String address) async {
    // https://deep-index.moralis.io/api/v2/erc20/metadata?chain=bsc%20testnet&addresses=0x784cb74865fde16039aca9f42bf998cf3c15319d

 List<MoralisToken> result = <MoralisToken>[];    
    try {
      var url =
          '${Constants.API_BASE_URL}/erc20/metadata?chain=$chain&addresses=$address';
      
      var response = await get(Uri.parse(url), headers: {
        'accept': 'application/json',
        'X-API-Key': Constants.API_KEY,
      });
      if (response.statusCode != 200) {
        throw Exception("API error");
      }

      List<dynamic> tokens = jsonDecode(response.body);

      result = tokens.map((value) => MoralisToken.fromJson(value)).toList();
      
      // print(result);
    } catch (e) {
      print(e);
    } finally {
      // client.close();
    }
    return result;
  }

  @override
  Future<EtherAmount> getNativeBalance(
      String chain, EthereumAddress walletAddress) {
    // TODO: implement getNativeBalance
    throw UnimplementedError();
  }

  @override
  Future<EtherAmount> getTokenBalance(String chain,
      EthereumAddress walletAddress, List<EthereumAddress> contractAddresses) {
    // TODO: implement getTokenBalance
    throw UnimplementedError();
  }

  @override
  Future getWalletTransactions(String chain, EthereumAddress walletAddress) {
    // TODO: implement getWalletTransactions
    // https://deep-index.moralis.io/api/v2/0xd6f88e70d479f5247b51e219638b7c144f1a9747/erc20/transfers?chain=bsc%20testnet
    // {
    // "total": 19,
    // "page": 0,
    // "page_size": 100,
    // "cursor": null,
    // "result": [
    //   {
    //     "transaction_hash": "0x268c5af52c77b8d85e9669a5544aef2c321403a82be3bd2c9f50616ddda8df23",
    // --------------------
    // Contract Address:
    // --------------------
    //     "address": "0x784cb74865fde16039aca9f42bf998cf3c15319d",
    //     "block_timestamp": "2022-03-04T17:33:31.000Z",
    //     "block_number": "17271479",
    //     "block_hash": "0x957bd0cc6710dc2a620002b2b262f3a77fccc847784cc9956b1e2e9ec7671030",
    //     "to_address": "0xed3e44f326dc237abc1e96b1d659fe0104e8217d",
    //     "from_address": "0xd6f88e70d479f5247b51e219638b7c144f1a9747",
    //     "value": "10000000000000000000"
    //   },
    // ...
    // ]
    // }

    throw UnimplementedError();
  }

  @override
  Future getNativeTransactions(String chain, EthereumAddress walletAddress) {
    // TODO: implement getNativeTransactions
    // https://deep-index.moralis.io/api/v2/0xd6f88e70d479f5247b51e219638b7c144f1a9747?chain=bsc%20testnet
    // {
    // "total": 17,
    // "page": 0,
    // "page_size": 100,
    // "cursor": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhZGRyZXNzIjoiMHhkNmY4OGU3MGQ0NzlmNTI0N2I1MWUyMTk2MzhiN2MxNDRmMWE5NzQ3IiwiY2hhaW4iOiJic2MgdGVzdG5ldCIsInRvX2Jsb2NrIjoiMTYzNjcwMDEiLCJibG9ja19vZmZzZXQiOjEsInRvdGFsIjoxNywicGFnZSI6MSwibGltaXQiOjEwMCwib2Zmc2V0IjowLCJpYXQiOjE2NTU1NzIwODZ9.jxiGqcU7kn9c1wqFZ8e6yyGQZtPQhsNBo6TMvey2P14",
    // "result": [
    //   {
    //     "hash": "0x268c5af52c77b8d85e9669a5544aef2c321403a82be3bd2c9f50616ddda8df23",
    //     "nonce": "15",
    //     "transaction_index": "1",
    //     "from_address": "0xd6f88e70d479f5247b51e219638b7c144f1a9747",
    //     "to_address": "0x784cb74865fde16039aca9f42bf998cf3c15319d",
    //     "value": "0",
    //     "gas": "36859",
    //     "gas_price": "10000000000",
    //     "input": "0xa9059cbb000000000000000000000000ed3e44f326dc237abc1e96b1d659fe0104e8217d0000000000000000000000000000000000000000000000008ac7230489e80000",
    //     "receipt_cumulative_gas_used": "75112",
    //     "receipt_gas_used": "36859",
    //     "receipt_contract_address": null,
    //     "receipt_root": null,
    //     "receipt_status": "1",
    //     "block_timestamp": "2022-03-04T17:33:31.000Z",
    //     "block_number": "17271479",
    //     "block_hash": "0x957bd0cc6710dc2a620002b2b262f3a77fccc847784cc9956b1e2e9ec7671030",
    //     "transfer_index": [
    //       17271479,
    //       1
    //     ]
    //   },
    // ...
    // ]
    // }

    throw UnimplementedError();
  }
}
