import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'package:computer_shop_app/src/presentation/pages/product_order/bloc/product_order_cubit.dart';
import 'package:computer_shop_app/src/presentation/widgets/button/app_button.dart';
import 'package:computer_shop_app/src/presentation/widgets/button/button.dart';
import 'package:computer_shop_app/src/utils/constants/app_theme.dart';
import 'package:computer_shop_app/src/presentation/pages/pay/pay.dart';
import 'package:computer_shop_app/src/presentation/pages/product_order/model/product_order_model.dart';

class ProductOrderListView extends StatelessWidget {

  const ProductOrderListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductOrderCubit, ProductOrderState>(
      builder: (BuildContext context, ProductOrderState state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Gap(10),
            Expanded(
              child: ListView.builder(
                itemCount: state.order.length,
                itemBuilder: (context, index) {
                  final order = state.order[index];
                  return Dismissible(
                    key: Key(order.id.toString()),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      color: AppTheme.red,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 20.0),
                      child: const Icon(
                        Icons.delete,
                        color: AppTheme.white,
                      ),
                    ),
                    onDismissed: (direction) {
                      if (direction == DismissDirection.endToStart) {
                        context.read<ProductOrderCubit>().deleteOrder(order);
                      }
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.black12, width: 0.25),
                          bottom: BorderSide(color: Colors.black12, width: 0.25),
                        ),
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            leading: Image.network(
                              order.image,
                              width: 60.0,
                              height: 60.0,
                              fit: BoxFit.cover,
                              errorBuilder: (
                                  BuildContext context,
                                  Object exception,
                                  StackTrace? stackTrace,
                                  ) {
                                return Container(
                                  width: 60.0,
                                  height: 60.0,
                                  color: AppTheme.white,
                                );
                              },
                            ),
                            title: Text(
                              order.name,
                              style: const TextStyle(fontSize: 16),
                            ),
                            subtitle: Text(
                              '฿${order.price.toString().replaceAllMapped(
                                RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                    (Match m) => '${m[1]},',
                              )}',
                              style: const TextStyle(
                                fontSize: 16.0,
                                color: AppTheme.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            _payProduct(context, state.order),
            const Gap(10),
          ],
        );
      },
    );
  }

  Widget _payProduct(BuildContext context, List<ProductOrderItem> orders) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Button(
        text: "ชำระเงิน",
        style: AppButton.defaultButtonStyle,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PayPage(orders: orders),
          ));
        },
      ),
    );
  }
}