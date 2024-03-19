import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

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
}
