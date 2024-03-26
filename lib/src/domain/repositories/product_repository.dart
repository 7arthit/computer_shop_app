import 'package:computer_shop_app/src/domain/entities/role/role_drop_downs.dart';
import 'package:computer_shop_app/src/domain/entities/search/search.dart';
import 'package:computer_shop_app/src/domain/entities/type/type_drop_downs.dart';
import 'package:dartz/dartz.dart';

import 'package:computer_shop_app/src/data/data_sources/helper/failure.dart';
import 'package:computer_shop_app/src/domain/entities/product/product.dart';

abstract class ProductRepository {

  Future<Either<Failure, List<Product>>> getProductList();

  Future<Either<Failure, Search>> getSearchProductList({String? productName, int? typeIdProducts});

  Future<Either<Failure, List<TypeDropDowns>>> getProductTypeList();
}
