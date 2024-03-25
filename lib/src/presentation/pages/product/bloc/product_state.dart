part of 'product_cubit.dart';

class ProductState extends Equatable {
  final List<Product> products;
  final bool isLoading;
  final bool canSearch;
  final ProductSearch search;
  final bool isValid;
  final FormzSubmissionStatus status;
  final bool showProducts;
  final String searchText;

  const ProductState({
    this.products = initialDataList,
    this.isLoading = false,
    this.canSearch = false,
    this.search = const ProductSearch.pure(),
    this.isValid = false,
    this.status = FormzSubmissionStatus.initial,
    this.showProducts = false,
    this.searchText = '',
  });

  ProductState copyWith({
    List<Product>? products,
    bool? isLoading,
    bool? canSearch,
    ProductSearch? search,
    bool? isValid,
    FormzSubmissionStatus? status,
    bool? showProducts,
    String? searchText,
  }) {
    return ProductState(
      products: products ?? this.products,
      isLoading: isLoading ?? this.isLoading,
      canSearch: canSearch ?? this.canSearch,
      search: search ?? this.search,
      isValid: isValid ?? this.isValid,
      status: status ?? this.status,
      showProducts: showProducts?? this.showProducts,
      searchText: searchText ?? this.searchText,
    );
  }

  @override
  List<Object?> get props => [products, isLoading, canSearch, search, isValid, status];
}
