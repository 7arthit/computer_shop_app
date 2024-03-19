import 'package:dartz/dartz.dart';

import 'package:computer_shop_app/src/data/data_sources/helper/failure.dart';
import 'package:computer_shop_app/src/domain/entities/product/product.dart';

abstract class ProductRepository {

  Future<Either<Failure, List<Product>>> getProductList();
}
