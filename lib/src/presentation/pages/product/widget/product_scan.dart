import 'package:computer_shop_app/src/utils/constants/app_theme.dart';
import 'package:flutter/material.dart';

class ProductScan extends StatefulWidget {
  const ProductScan({super.key});

  @override
  State<ProductScan> createState() => _ProductScanState();
}

class _ProductScanState extends State<ProductScan> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppTheme.white,
    );
  }
}
