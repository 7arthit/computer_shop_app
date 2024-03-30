import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'package:computer_shop_app/src/presentation/pages/product_order/bloc/product_order_cubit.dart';
import 'package:computer_shop_app/src/presentation/widgets/button/app_button.dart';
import 'package:computer_shop_app/src/presentation/widgets/button/button.dart';
import 'package:computer_shop_app/src/utils/constants/app_theme.dart';

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
                  return Card(
                      color: AppTheme.white,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0,
                      ),
                      elevation: 0.25,
                      child: ListTile(
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
                          order.price,
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: AppTheme.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                },
              ),
            ),
            _payProduct(),
            const Gap(10),
          ],
        );
      },
    );
  }

  Widget _payProduct() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Button(
        text: "ชำระเงิน",
        style: AppButton.defaultButtonStyle,
        onPressed: () {},
      ),
    );
  }
}