import 'package:bloc/bloc.dart';
import 'package:computer_shop_app/src/presentation/pages/product/model/product_model.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:injectable/injectable.dart';

import 'package:computer_shop_app/src/domain/entities/product/product.dart';
import 'package:computer_shop_app/src/domain/usecase/product_usecase.dart';

part 'product_state.dart';

@Injectable()
class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.useCase) : super(const ProductState());

  @FactoryMethod()
  final ProductUseCase useCase;

  Future<void> searchTextChanged(String searchText) async {
    emit(state.copyWith(searchText: searchText));

    if (searchText.isEmpty) {
      emit(state.copyWith(
        canSearch: true,
        showProducts: true,
        searchText: searchText
      ));
    } else {
      emit(state.copyWith(
        canSearch: true,
        showProducts: false,
        searchText: searchText
      ));
    }
  }

  Future<void> getDataList() async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      final result = await useCase.getProductList();

      result.fold(
            (failure) {
          emit(state.copyWith(status: FormzSubmissionStatus.failure));
        },
            (data) {
          Future(() async {
            emit(state.copyWith(
              products: data,
              status: FormzSubmissionStatus.success,
            ));
          });
        },
      );
    } catch (_) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }

  Future<void> reset() async {
    emit(const ProductState());
  }
}