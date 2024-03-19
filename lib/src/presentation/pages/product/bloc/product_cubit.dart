import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import 'package:computer_shop_app/src/domain/entities/product/product.dart';
import 'package:computer_shop_app/src/domain/usecase/product_usecase.dart';

part 'product_state.dart';

@Injectable()
class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.useCase) : super(const ProductState(products: []));

  @FactoryMethod()
  final ProductUseCase useCase;

  Future<void> loadProducts() async {
    emit(state.copyWith(isLoading: true));

    final result = await useCase.getProductList();
    result.fold(
          (failure) => emit(
              state.copyWith(
                  products: [],
                  isLoading: false
              ),
          ),
          (products) => emit(
              state.copyWith(
                  products: products,
                  isLoading: false
              ),
          ),
    );
  }
}