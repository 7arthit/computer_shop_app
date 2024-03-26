import 'package:formz/formz.dart';

import 'package:computer_shop_app/src/domain/entities/product/product.dart';

enum ProductSearchValidationError { empty }

class ProductSearch extends FormzInput<String, ProductSearchValidationError> {
  const ProductSearch.pure() : super.pure('');
  const ProductSearch.dirty([String value = '']) : super.dirty(value);

  @override
  ProductSearchValidationError? validator(String value) {
    return value.isEmpty ? ProductSearchValidationError.empty : null;
  }
}

enum ProductTypeValidationError { empty }

class ProductType extends FormzInput<int, ProductTypeValidationError> {
  const ProductType.pure() : super.pure(1);
  const ProductType.dirty([int value = 1]) : super.dirty(value);

  @override
  ProductTypeValidationError? validator(int value) {
    return value == 1 ? ProductTypeValidationError.empty : null;
  }
}

const List<Product> initialDataList = [];
