part of 'product_order_cubit.dart';

class ProductOrderState extends Equatable {
  final List<ProductOrderItem> order;
  final bool isLoading;

  const ProductOrderState({
    required this.order,
    this.isLoading = false,
  });

  ProductOrderState copyWith({
    List<ProductOrderItem>? order,
    bool? isLoading,
  }) {
    return ProductOrderState(
      order: order ?? this.order,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [order, isLoading];
}
