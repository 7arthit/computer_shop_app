import 'package:computer_shop_app/src/domain/entities/product/product.dart';
import 'package:formz/formz.dart';

enum ProductSearchValidationError { empty }

class ProductSearch extends FormzInput<String, ProductSearchValidationError> {
  const ProductSearch.pure() : super.pure('');
  const ProductSearch.dirty([String value = '']) : super.dirty(value);

  @override
  ProductSearchValidationError? validator(String value) {
    return value.isEmpty ? ProductSearchValidationError.empty : null;
  }
}

const List<Product> initialDataList = [];
