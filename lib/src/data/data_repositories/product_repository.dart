import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:computer_shop_app/src/data/data_sources/helper/exception.dart';
import 'package:computer_shop_app/src/data/data_sources/helper/failure.dart';
import 'package:computer_shop_app/src/data/data_sources/remote/rest_client.dart';
import 'package:computer_shop_app/src/domain/entities/product/product.dart';
import 'package:computer_shop_app/src/domain/repositories/product_repository.dart';

@Injectable(as: ProductRepository)
class DataProductRepository extends ProductRepository {

  @FactoryMethod()
  final RestClient _client;

  DataProductRepository(this._client);

  @override
  Future<Either<Failure, List<Product>>> getProductList() async {
    try {
      final response = await _client.product();
      return Right(response.data.data);
    } on NotFoundException {
      return const Left(Failure(message: "occurred error!"));
    } on DioException catch (e) {
      final response = Failure.fromJson(e.response!.data);
      if (e.response?.statusCode == 401) {
        return Left(UnAuthorizeFailure(
          code: response.code ?? e.response?.statusCode.toString(),
          errors: response.errors,
          message: response.message,
          statusCode: e.response?.statusCode,
        ));
      }
      return Left(response);
    }
  }
}
