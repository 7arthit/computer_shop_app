import 'package:flutter/material.dart';

import 'package:computer_shop_app/src/presentation/widgets/text/mesage.dart';
import 'package:computer_shop_app/src/presentation/widgets/appbar/custom_appbar.dart';
import 'package:computer_shop_app/src/utils/constants/app_theme.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      appBar: const CustomAppBar(title: 'แสกน'),
      body: InkWell(
        onTap: () {},
        child: const Center(
          child: Message(
            message: 'เตะเพื่อเปิดกล้อง แสกน QR Code สินค้า',
            icon: Icons.qr_code_scanner_rounded,
          ),
        ),
      ),
    );
  }
}
