import 'package:flutter/material.dart';

import 'package:computer_shop_app/src/presentation/pages/pay/widget/pay_form.dart';
import 'package:computer_shop_app/src/presentation/pages/product_order/model/product_order_model.dart';
import 'package:computer_shop_app/src/presentation/widgets/appbar/custom_appbar.dart';
import 'package:computer_shop_app/src/utils/constants/app_theme.dart';

class PayPage extends StatelessWidget {
  final List<ProductOrderItem> orders;

  const PayPage({Key? key, required this.orders}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      appBar: const CustomAppBar(title: 'ชำระเงิน'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: PayForm(orders: orders),
            ),
          ),
        ],
      ),
    );
  }
}
