import 'package:flutter/material.dart';

import '../models/network_type.dart';

// ignore: avoid_classes_with_only_static_members
class AppConfig {
  static const String currency = "\$";

  static Map<NetworkType, AppConfigParams> networks =
      <NetworkType, AppConfigParams>{
    NetworkType.Local: AppConfigParams(
      'http://192.168.40.197:8545',
      '0xD933a953f4786Eed5E58D234dFeadE15c96bAa8b',
      web3RdpUrl: 'ws://192.168.40.197:8545',
      symbol: 'ETH',
      faucetUrl: 'about:blank',
      enabled: false,
      label: 'Local (Truffle)',
    ),
    NetworkType.Ethereum: AppConfigParams(
      // 'https://ropsten.infura.io/v3/628074215a2449eb960b4fe9e95feb09',
      'https://speedy-nodes-nyc.moralis.io/edc1ed093a24ce3b8ae1038c/eth/ropsten',
      // '0x5060b60cb8Bd1C94B7ADEF4134555CDa7B45c461',
      '0x784cb74865fde16039aca9f42bf998cf3c15319d',
      // web3RdpUrl:
      //     'wss://ropsten.infura.io/ws/v3/628074215a2449eb960b4fe9e95feb09',
      web3RdpUrl:
          'wss://speedy-nodes-nyc.moralis.io/edc1ed093a24ce3b8ae1038c/eth/ropsten/ws',
      symbol: 'ETH',
      faucetUrl: 'https://faucet.ropsten.be',
      enabled: true,
      // icon: WalletIcons.ethereum,
      label: 'Ethereum (Ropsten)',
    ),
    NetworkType.BSC: AppConfigParams(
      // 'https://data-seed-prebsc-1-s1.binance.org:8545',
      'https://speedy-nodes-nyc.moralis.io/edc1ed093a24ce3b8ae1038c/bsc/mainnet',
      // '0x73434bb95eC80d623359f6f9d7b84568407187BA',
      '0x784cb74865fde16039aca9f42bf998cf3c15319d',
      web3RdpUrl:
          'wss://speedy-nodes-nyc.moralis.io/edc1ed093a24ce3b8ae1038c/bsc/mainnet/ws',
      symbol: 'BNB',
      faucetUrl: 'https://testnet.binance.org/faucet-smart',
      enabled: true,
      label: 'Binance Chain (BSC)',
    ),
    NetworkType.BSCTest: AppConfigParams(
      // 'https://data-seed-prebsc-1-s1.binance.org:8545',
      'https://speedy-nodes-nyc.moralis.io/edc1ed093a24ce3b8ae1038c/bsc/testnet',
      // '0x73434bb95eC80d623359f6f9d7b84568407187BA',
      '0x784cb74865fde16039aca9f42bf998cf3c15319d',
      web3RdpUrl:
          'wss://speedy-nodes-nyc.moralis.io/edc1ed093a24ce3b8ae1038c/bsc/testnet/ws',
      symbol: 'TBNB',
      faucetUrl: 'https://testnet.binance.org/faucet-smart',
      enabled: true,
      label: 'Binance Testnet (BSC)',
    ),
    NetworkType.Matic: AppConfigParams(
      'https://speedy-nodes-nyc.moralis.io/edc1ed093a24ce3b8ae1038c/polygon/mainnet',
      // 'https://rpc-mumbai.maticvigil.com',
      '0x784cb74865fde16039aca9f42bf998cf3c15319d',
      // '0x73434bb95eC80d623359f6f9d7b84568407187BA',
      // web3RdpUrl: 'wss://ws-mumbai.matic.today',
      web3RdpUrl:
          'wss://speedy-nodes-nyc.moralis.io/edc1ed093a24ce3b8ae1038c/polygon/mainnet/ws',
      symbol: 'MATIC',
      faucetUrl: 'https://faucet.matic.network',
      enabled: true,
      label: 'Matic (Main)',
    ),
    NetworkType.MaticTest: AppConfigParams(
      'https://speedy-nodes-nyc.moralis.io/edc1ed093a24ce3b8ae1038c/polygon/mumbai',
      // 'https://rpc-mumbai.maticvigil.com',
      '0x784cb74865fde16039aca9f42bf998cf3c15319d',
      // '0x73434bb95eC80d623359f6f9d7b84568407187BA',
      // web3RdpUrl: 'wss://ws-mumbai.matic.today',
      web3RdpUrl:
          'wss://speedy-nodes-nyc.moralis.io/edc1ed093a24ce3b8ae1038c/polygon/mumbai/ws',
      symbol: 'MATIC',
      faucetUrl: 'https://faucet.matic.network',
      enabled: true,
      label: 'Matic (Mumbai)',
    )
  };
}

class AppConfigParams {
  AppConfigParams(this.web3HttpUrl, this.contractAddress,
      {required this.symbol,
      required this.faucetUrl,
      required this.enabled,
      required this.label,
      this.web3RdpUrl,
      this.icon // = WalletIcons.coins,
      });
  final String? web3RdpUrl;
  final String web3HttpUrl;
  final String contractAddress;
  final String symbol;
  final String faucetUrl;
  final IconData? icon;
  final bool enabled;
  final String label;
}
