import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:injectable/injectable.dart';

import 'package:computer_shop_app/src/domain/entities/search/search.dart';
import 'package:computer_shop_app/src/domain/entities/type/type_drop_downs.dart';
import 'package:computer_shop_app/src/presentation/pages/product/model/product_model.dart';
import 'package:computer_shop_app/src/domain/entities/product/product.dart';
import 'package:computer_shop_app/src/domain/usecase/product_usecase.dart';

part 'product_state.dart';

@Injectable()
class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.useCase) : super(const ProductState());

  @FactoryMethod()
  final ProductUseCase useCase;

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

  void searchChanged(String search) async {
    final value = ProductSearch.dirty(search);

    if (search.isEmpty) {
      emit(state.copyWith(
        search: value,
        isValid: Formz.validate([value]),
        canSearch: true,
        showProducts: true,
      ));
    } else {
      emit(state.copyWith(
        search: value,
        isValid: Formz.validate([value]),
        canSearch: true,
        showProducts: false,
      ));

      await getSearchDataList();
    }
  }

  void typeChanged(int typeId) async {
      emit(state.copyWith(
        typeIdProducts: typeId,
      ));
      await getSearchDataList();
  }

  Future<void> getSearchDataList() async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      final result = await useCase.getSearchProductList(
          state.search.value,
          state.typeIdProducts,
      );

      result.fold(
            (failure) {
          emit(state.copyWith(status: FormzSubmissionStatus.failure));
        },
            (data) {
          Future(() async {
            emit(state.copyWith(
              searchProducts: data,
              status: FormzSubmissionStatus.success,
            ));
          });
        },
      );
    } catch (_) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }

  Future<void> productTypeItems() async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      final result = await useCase.getProductTypeList();

      result.fold(
            (failure) {
          emit(state.copyWith(status: FormzSubmissionStatus.failure));
        },
            (data) {
          Future(() async {
            final newState = state.copyWith(
              productTypeItems: data,
              status: FormzSubmissionStatus.success,
            );
            emit(newState);
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