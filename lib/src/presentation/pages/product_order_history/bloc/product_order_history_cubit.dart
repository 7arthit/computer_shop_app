import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import 'package:computer_shop_app/src/presentation/pages/product_order_history/model/product_order_history_model.dart';

part 'product_order_history_state.dart';

@Injectable()
class ProductOrderHistoryCubit extends Cubit<ProductOrderHistoryState> {
  ProductOrderHistoryCubit()
      : super(const ProductOrderHistoryState(orderHistory: []));

  Future<void> loadOrderHistoryItems() async {
    emit(state.copyWith(isLoading: true));

    final order = [
      ProductOrderHistoryItem(
        id: 3,
        customer_name: 'อาทิตย์ ทวีบท',
        sum_price: 17100,
        amount: 1,
        date: DateTime(2024, 3, 31),
      ),
      ProductOrderHistoryItem(
        id: 2,
        customer_name: 'กานต์ บุพโชติ',
        sum_price: 17100,
        amount: 1,
        date: DateTime(2024, 3, 31),
      ),
      ProductOrderHistoryItem(
        id: 1,
        customer_name: 'บารมี ศรีโสดา',
        sum_price: 51300,
        amount: 3,
        date: DateTime(2024, 3, 31),
      ),
      ProductOrderHistoryItem(
        id: 0,
        customer_name: 'อาทิตย์ ทวีบท',
        sum_price: 34200,
        amount: 2,
        date: DateTime(2024, 3, 30),
      ),
    ];

    emit(state.copyWith(orderHistory: order, isLoading: false));
  }
}
