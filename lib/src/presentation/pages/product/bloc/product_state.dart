part of 'product_cubit.dart';

class ProductState extends Equatable {
  final List<Product> products;
  final Search? searchProducts;
  final bool isLoading;
  final bool canSearch;
  final ProductSearch search;
  final bool isValid;
  final FormzSubmissionStatus status;
  final bool showProducts;
  final String searchText;
  final int typeIdProducts;
  final List<TypeDropDowns> productTypeItems;

  const ProductState({
    this.products = initialDataList,
    this.searchProducts,
    this.isLoading = false,
    this.canSearch = false,
    this.search = const ProductSearch.pure(),
    this.isValid = false,
    this.status = FormzSubmissionStatus.initial,
    this.showProducts = false,
    this.searchText = '',
    this.typeIdProducts = 1,
    this.productTypeItems = const [],
  });

  ProductState copyWith({
    List<Product>? products,
    Search? searchProducts,
    bool? isLoading,
    bool? canSearch,
    ProductSearch? search,
    bool? isValid,
    FormzSubmissionStatus? status,
    bool? showProducts,
    String? searchText,
    int? typeIdProducts,
    List<TypeDropDowns>? productTypeItems,
  }) {
    return ProductState(
      products: products ?? this.products,
      searchProducts: searchProducts ?? this.searchProducts,
      isLoading: isLoading ?? this.isLoading,
      canSearch: canSearch ?? this.canSearch,
      search: search ?? this.search,
      isValid: isValid ?? this.isValid,
      status: status ?? this.status,
      showProducts: showProducts?? this.showProducts,
      searchText: searchText ?? this.searchText,
      typeIdProducts: typeIdProducts ?? this.typeIdProducts,
      productTypeItems: productTypeItems ?? this.productTypeItems
    );
  }

  @override
  List<Object?> get props => [products, searchProducts, isLoading, canSearch, search, isValid, status, typeIdProducts, productTypeItems];
}
