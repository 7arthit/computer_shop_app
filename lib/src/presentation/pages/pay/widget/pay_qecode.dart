
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'package:computer_shop_app/src/utils/constants/app_theme.dart';

class PayQRCode extends StatelessWidget {
  final String paymentData;

  const PayQRCode(this.paymentData, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      appBar: _appbar(context),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18.0),
                  topRight: Radius.circular(18.0),
                ),
                color: AppTheme.red,
              ),
              child: Image.asset(
                'assets/images/ComShop1.png',
                width: 230,
                height: 100,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: const BoxDecoration(
                color: AppTheme.red,
              ),
              child: QrImageView(
                data: paymentData,
                version: QrVersions.auto,
                size: 230.0,
                eyeStyle: const QrEyeStyle(
                  eyeShape: QrEyeShape.square,
                  color: AppTheme.white,
                ),
                dataModuleStyle: const QrDataModuleStyle(
                  dataModuleShape: QrDataModuleShape.square,
                  color: AppTheme.white,
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(18.0),
                  bottomRight: Radius.circular(18.0),
                ),
                color: AppTheme.red,
              ),
              child: Image.asset(
                'assets/images/Qrcode.png',
                width: 230,
                height: 120,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _appbar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: AppBar(
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        leading: Container(
          margin: const EdgeInsets.only(left: 14.0),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppTheme.red,
          ),
          child: IconButton(
            icon: const Icon(Icons.chevron_left, size: 28),
            onPressed: () {
              Navigator.pop(context);
            },
            color: AppTheme.white,
          ),
        ),
      ),
    );
  }
}