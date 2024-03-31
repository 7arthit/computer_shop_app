import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:computer_shop_app/src/presentation/widgets/text/mesage.dart';
import 'package:computer_shop_app/src/utils/constants/app_theme.dart';
import 'package:computer_shop_app/src/presentation/pages/product_order_history/bloc/product_order_history_cubit.dart';
import 'package:computer_shop_app/src/presentation/pages/product_order_history/widget/product_order_history_list.dart';

class ProductOrderHistoryPage extends StatefulWidget {
  const ProductOrderHistoryPage({super.key});

  @override
  State<ProductOrderHistoryPage> createState() =>
      _ProductOrderHistoryPageState();
}

class _ProductOrderHistoryPageState extends State<ProductOrderHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<ProductOrderHistoryCubit>().loadOrderHistoryItems(),
      builder: (context, snapshot) {
        return Container(
          color: AppTheme.white,
          child:
              BlocBuilder<ProductOrderHistoryCubit, ProductOrderHistoryState>(
            builder: (context, state) {
              return state.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : state.orderHistory.isEmpty
                      ? const Message(
                          message: 'ไม่มีประวัติคำสั่งซื้อ',
                          icon: Icons.remove_shopping_cart_outlined,
                        )
                      : const ProductOrderHistoryList();
            },
          ),
        );
      },
    );
  }
}
