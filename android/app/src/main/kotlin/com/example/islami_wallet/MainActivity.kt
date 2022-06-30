package com.example.islami_wallet

import io.flutter.embedding.android.FlutterFragmentActivity

class MainActivity: FlutterFragmentActivity() {
    init {
        System.loadLibrary("TrustWalletCore")
    }
}
