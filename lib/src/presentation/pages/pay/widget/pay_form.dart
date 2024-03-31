import 'package:flutter/material.dart';

import 'package:computer_shop_app/src/presentation/pages/product_order/model/product_order_model.dart';
import 'package:computer_shop_app/src/presentation/widgets/button/app_button.dart';
import 'package:computer_shop_app/src/presentation/widgets/button/button.dart';
import 'package:computer_shop_app/src/presentation/widgets/text/text_input_form.dart';
import 'package:computer_shop_app/src/presentation/widgets/text/text_label.dart';
import 'package:computer_shop_app/src/utils/constants/app_theme.dart';
import 'package:computer_shop_app/src/presentation/pages/pay/widget/pay_qecode.dart';

class PayForm extends StatelessWidget {
  final List<ProductOrderItem> orders;

  const PayForm({Key? key, required this.orders}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(padding: EdgeInsets.all(10)),
          _DetailOrderPay(orders: orders),
          const Padding(padding: EdgeInsets.all(10)),
          _UsernameCustomerInput(),
          const Padding(padding: EdgeInsets.all(15)),
          _PayScanButton(),
        ],
      ),
    );
  }
}

class _DetailOrderPay extends StatelessWidget {
  final List<ProductOrderItem> orders;

  const _DetailOrderPay({Key? key, required this.orders}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, List<ProductOrderItem>> groupedOrders = {};
    orders.forEach((order) {
      final key = order.name;
      if (groupedOrders.containsKey(key)) {
        groupedOrders[key]!.add(order);
      } else {
        groupedOrders[key] = [order];
      }
    });

    return Card(
      color: AppTheme.white,
      elevation: 0.05,
      margin: const EdgeInsets.symmetric(vertical: 4),
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.black12),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: groupedOrders.entries.map((entry) {
          final nameOrder = entry.key;
          final orderList = entry.value;
          final totalPrice = orderList.fold<int>(0,(previousValue, order) =>
                  previousValue + int.parse(order.price.toString()));
          final itemCount = orderList.length;

          return ListTile(
            title: Text(
              nameOrder,
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
            trailing: Text(
                '฿${orderList.first.price.toString().replaceAllMapped(
                      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                      (Match m) => '${m[1]},',
                    )} (${itemCount > 0 ? ' x$itemCount' : ''} )',
                style: const TextStyle(
                  fontSize: 16.0,
                )),
            subtitle: Text(
                'ราคารวม : ${totalPrice.toString().replaceAllMapped(
                      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                      (Match m) => '${m[1]},',
                    )}',
                style: const TextStyle(
                  fontSize: 16.0,
                  color: AppTheme.red,
                  fontWeight: FontWeight.bold,
                )),
          );
        }).toList(),
      ),
    );
  }
}

class _UsernameCustomerInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextLabel(text: "ชื่อลูกค้า"),
        TextInputForm(
          icon: const Icon(Icons.person, color: AppTheme.red),
          onChanged: (text) {},
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppTheme.black20),
          ),
        ),
      ],
    );
  }
}

class _PayScanButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Button(
      text: "สแกนเพื่อชำระเงิน",
      style: AppButton.defaultButtonStyle,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const PayQRCode('data'),
          ),
        );
      },
    );
  }
}
