part of 'product_order_history_cubit.dart';

class ProductOrderHistoryState extends Equatable {
  final List<ProductOrderHistoryItem> orderHistory;
  final bool isLoading;

  const ProductOrderHistoryState({
    required this.orderHistory,
    this.isLoading = false,
  });

  ProductOrderHistoryState copyWith({
    List<ProductOrderHistoryItem>? orderHistory,
    bool? isLoading,
  }) {
    return ProductOrderHistoryState(
      orderHistory: orderHistory ?? this.orderHistory,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [orderHistory, isLoading];
}
