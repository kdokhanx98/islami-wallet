import 'dart:developer';
import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islami_wallet/theme/colors.dart';
import 'package:islami_wallet/widgets/custom_icon_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:permission_handler/permission_handler.dart';

typedef OnScanned = void Function(String? address);

class QRScanningPage extends StatefulWidget {
  final OnScanned? onScanned;
  final bool closeWhenScanned;

  const QRScanningPage({
    Key? key,
    this.onScanned,
    this.closeWhenScanned = true,
  }) : super(key: key);

  @override
  State<QRScanningPage> createState() => _QRScanningPageState();
}

class _QRScanningPageState extends State<QRScanningPage> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  static final RegExp _basicAddress =
      RegExp(r'^(0x)?[0-9a-f]{40}', caseSensitive: false);

  StreamSubscription? _subscription;

  bool canShowQRScanner = false;

  @override
  void initState() {
    super.initState();

    getCameraPermission();
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void getCameraPermission() async {
    // print(await Permission.camera.status); // prints PermissionStatus.granted
    var status = await Permission.camera.status;
    if (status != PermissionStatus.granted) {
      final result = await Permission.camera.request();
      if (result == PermissionStatus.granted) {
        setState(() {
          canShowQRScanner = true;
        });
      }
      // else {
      //   // Scaffold.of(context).showSnackBar(
      //   //     SnackBar(content: Text('Please enable camera to scan barcodes')));
      //   Navigator.of(context).pop();
      // }
    } else {
      setState(() {
        canShowQRScanner = true;
      });
    }
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    _subscription = controller.scannedDataStream.listen((scanData) {
      // metamask qrcode adds "ethereum:" in front of the address.
      final address = scanData.code?.replaceAll('ethereum:', '');

      if (address == null || !_basicAddress.hasMatch(address)) {
        return;
      }

      widget.onScanned!(address);

      if (widget.closeWhenScanned) {
        _subscription?.cancel();

        if (Navigator.canPop(context)) {
          Navigator.pop(context);
        }
      }
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No permissions set for the camera')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray8,
      appBar: AppBar(
        title: const Text("QR Reader"),
        backgroundColor: AppColors.gray8,
        shadowColor: Colors.transparent,
        actions: [
          const Align(
            alignment: Alignment.centerRight,
            child: const CustomIconWidget(
              borderColor: AppColors.gray7,
              svgName: 'ic_close',
            ),
          ),
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // SizedBox(
            //   height: 2.h,
            // ),
            !canShowQRScanner
                ? const Center(
                    child: Text(
                        "You didn't grant permissions to use your camera !"))
                : Expanded(child: _buildQrView(context)),
          ],
        ),
      )),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.white,
          overlayColor: AppColors.gray8,
          borderRadius: 20,
          borderLength: 40,
          borderWidth: 1.w,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }
}
