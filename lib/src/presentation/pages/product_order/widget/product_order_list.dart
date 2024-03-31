import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:computer_shop_app/src/presentation/pages/product_order/bloc/product_order_cubit.dart';
import 'package:computer_shop_app/src/presentation/pages/product_order/widget/product_order_listview.dart';
import 'package:computer_shop_app/src/presentation/widgets/text/mesage.dart';
import 'package:computer_shop_app/src/utils/constants/app_theme.dart';

class ProductOrderList extends StatefulWidget {
  const ProductOrderList({super.key});

  @override
  State<ProductOrderList> createState() => _ProductOrderListState();
}

class _ProductOrderListState extends State<ProductOrderList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<ProductOrderCubit>().loadOrderItems(),
      builder: (context, snapshot) {
        return Container(
            color: AppTheme.white,
            child: BlocBuilder<ProductOrderCubit, ProductOrderState>(
            builder: (context, state) {
              return state.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : state.order.isEmpty
                  ? const Message(
                      message: 'ไม่มีรายการสินค้า',
                      icon: Icons.error_outline,
                    )
                  : const ProductOrderListView();
            },
          ),
        );
      },
    );
  }
}
