import 'package:computer_shop_app/src/domain/entities/role/role_drop_downs.dart';
import 'package:computer_shop_app/src/domain/entities/type/type_drop_downs.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:computer_shop_app/src/domain/entities/search/search.dart';
import 'package:computer_shop_app/src/data/data_sources/helper/failure.dart';
import 'package:computer_shop_app/src/domain/entities/product/product.dart';
import 'package:computer_shop_app/src/domain/repositories/product_repository.dart';

@LazySingleton()
class ProductUseCase {
  final ProductRepository repo;

  ProductUseCase(this.repo);

  Future<Either<Failure, List<Product>>> getProductList() async {
    return repo.getProductList();
  }

  Future<Either<Failure, Search>> getSearchProductList(String? productName, int? typeIdProducts) {
    return repo.getSearchProductList(productName: productName, typeIdProducts: typeIdProducts);
  }

  Future<Either<Failure, List<TypeDropDowns>>> getProductTypeList() async {
    return repo.getProductTypeList();
  }
}
