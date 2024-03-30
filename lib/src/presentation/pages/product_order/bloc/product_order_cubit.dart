import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import 'package:computer_shop_app/src/presentation/pages/product_order/model/product_order_model.dart';

part 'product_order_state.dart';

@Injectable()
class ProductOrderCubit extends Cubit<ProductOrderState> {
  ProductOrderCubit() : super(const ProductOrderState(order: []));

  Future<void> loadOrderItems() async {
    emit(state.copyWith(isLoading: true));

    final order = [
      ProductOrderItem(
        id: 1,
        name: 'VGA (การ์ดแสดงผล) POWERCOLOR FIGHTER AMD RADEON RX 6700 XT 12GB GDDR6 (AXRX 6700 XT 12GBD6-3DH)',
        price: '17,100',
        image: 'https://www.jib.co.th/img_master/product/medium/2022012914452251306_1.jpg?v=513061643625842',
      ),
     ProductOrderItem(
        id: 0,
        name: 'VGA (การ์ดแสดงผล) POWERCOLOR FIGHTER AMD RADEON RX 6700 XT 12GB GDDR6 (AXRX 6700 XT 12GBD6-3DH)',
        price: '17,100',
        image: 'https://www.jib.co.th/img_master/product/medium/2022012914452251306_1.jpg?v=513061643625842',
      ),
    ];

    emit(state.copyWith(order: order, isLoading: false));
  }

  void deleteOrder(ProductOrderItem order) {
    final updatedOrder =
    state.order.where((n) => n.id != order.id).toList();
    emit(state.copyWith(order: updatedOrder));
  }
}
