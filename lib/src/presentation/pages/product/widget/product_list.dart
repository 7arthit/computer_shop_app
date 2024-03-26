import 'package:flutter/material.dart';

import 'package:computer_shop_app/src/presentation/widgets/text/mesage.dart';
import 'package:computer_shop_app/src/utils/constants/app_theme.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductScanState();
}

class _ProductScanState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      body: const Message(message: 'ไม่มีรายการ'),
      floatingActionButton: _addProductToCart(context),
    );
  }

  Widget _addProductToCart(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {},
      icon: const Icon(
        Icons.qr_code_scanner,
        color: Colors.white,
        size: 18,
      ),
      label: const Text(
        'สแกนสินค้า',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      backgroundColor: AppTheme.red,
      elevation: 0.5,
    );
  }
}
