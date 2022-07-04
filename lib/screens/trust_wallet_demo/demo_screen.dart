
import 'package:flutter/material.dart';
import 'package:flutter_trust_wallet_core/flutter_trust_wallet_core.dart';

import 'bitcoin_address_example.dart';
import 'bitcoin_transaction_example.dart';
import 'ethereum_example.dart';
import 'private_key_is_valid_example.dart';
import 'tron_example.dart';

class DemoWalletPage extends StatefulWidget {
  const DemoWalletPage({Key? key}) : super(key: key);

  @override
  State<DemoWalletPage> createState() => _DemoWalletPageState();
}

class _DemoWalletPageState extends State<DemoWalletPage> {
  String text = '';
  late HDWallet wallet;

  @override
  void initState() {
    super.initState();
    String mnemonic =
        "rent craft script crucial item someone dream federal notice page shrug pipe young hover duty"; // 有测试币的 tron地址
    wallet = HDWallet.createWithMnemonic(mnemonic);
  }

  Widget _exampleItem({
    required String name,
    required WidgetBuilder builder,
  }) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: builder));
      },
      child: Text(name),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('wallet core example app'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Text(wallet.mnemonic()),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _exampleItem(
                    name: 'Ethereum',
                    builder: (_) {
                      return EthereumExample(wallet);
                    },
                  ),
                  _exampleItem(
                    name: 'Bitcoin Address',
                    builder: (_) {
                      return BitcoinAddressExample(wallet);
                    },
                  ),
                  _exampleItem(
                    name: 'Bitcoin Transaction',
                    builder: (_) {
                      return BitcoinTransactionExample(wallet);
                    },
                  ),
                  _exampleItem(
                    name: 'Tron',
                    builder: (_) {
                      return TronExample(wallet);
                    },
                  ),
                  _exampleItem(
                    name: 'PrivateKey.isValid(a,b)',
                    builder: (_) {
                      return PrivateKeyIsValidExample(wallet);
                    },
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                wallet.delete();
                wallet = HDWallet();
                setState(() {});
              },
              child: Text("gen"),
            ),
          ],
        ),
      ),
    );
  }
}
