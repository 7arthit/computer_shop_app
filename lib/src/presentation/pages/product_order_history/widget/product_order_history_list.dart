import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';

import 'package:computer_shop_app/src/utils/constants/app_theme.dart';
import 'package:computer_shop_app/src/presentation/pages/product_order_history/bloc/product_order_history_cubit.dart';
import 'package:computer_shop_app/src/presentation/pages/product_order_history/model/product_order_history_model.dart';

class ProductOrderHistoryList extends StatelessWidget {
  const ProductOrderHistoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductOrderHistoryCubit, ProductOrderHistoryState>(
      builder: (BuildContext context, ProductOrderHistoryState state) {
        return GroupedListView<dynamic, DateTime>(
          elements: state.orderHistory,
          groupBy: (notification) => notification.date,
          groupSeparatorBuilder: (DateTime date) => Padding(
            padding:
                const EdgeInsets.only(left: 18, top: 10, bottom: 10, right: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _formatDate(date, DateTime.now()),
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black54,
                  ),
                ),
                Text(
                  '${_getNumberOfItems(date, state.orderHistory)} รายการ',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          itemBuilder: (context, orderHistory) =>
              _orderHistoryItem(context, orderHistory, state),
          order: GroupedListOrder.DESC,
        );
      },
    );
  }

  Widget _orderHistoryItem(BuildContext context,
      ProductOrderHistoryItem orderHistory, ProductOrderHistoryState state) {
    return Card(
      color: AppTheme.red,
      margin: const EdgeInsets.symmetric(
        vertical: 2.0,
        horizontal: 16.0,
      ),
      child: ListTile(
        title: Text(
          'ชื่อลูกค้า : ${orderHistory.customer_name}',
          style: const TextStyle(
            fontSize: 20,
            color: AppTheme.white,
          ),
        ),
        subtitle: Text(
          'จำนวน : ${orderHistory.amount.toString()} ชิ้น',
          style: const TextStyle(
            fontSize: 16.0,
            color: AppTheme.white,
          ),
        ),
        trailing: Text(
          'ราคารวม : ${orderHistory.sum_price.toString().replaceAllMapped(
                RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                (Match m) => '${m[1]},',
              )}',
          style: const TextStyle(
            fontSize: 18.0,
            color: AppTheme.white,
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date, DateTime today) {
    if (date.year == today.year &&
        date.month == today.month &&
        date.day == today.day) {
      return 'วันนี้';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }

  int _getNumberOfItems(
      DateTime date, List<ProductOrderHistoryItem> orderHistory) {
    return orderHistory.where((item) => item.date == date).length;
  }
}
