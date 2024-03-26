import 'package:computer_shop_app/src/data/data_models/request/login_request.dart';
import 'package:computer_shop_app/src/data/data_models/response/login_response.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:computer_shop_app/src/data/data_sources/helper/exception.dart';
import 'package:computer_shop_app/src/data/data_sources/helper/failure.dart';
import 'package:computer_shop_app/src/data/data_sources/remote/rest_client.dart';
import 'package:computer_shop_app/src/domain/entities/role/role_drop_downs.dart';
import 'package:computer_shop_app/src/domain/repositories/authentication_repository.dart';

@Injectable(as: AuthenticationRepository)
class DataAuthenticationRepository extends AuthenticationRepository {

  @FactoryMethod()
  final RestClient _client;

  DataAuthenticationRepository(this._client);

  @override
  Future<Either<Failure, LoginResponse>> login({
    required String username,
    required String password,
    required String roleId,
  }) async {
    try {
      int roleIds = int.parse(roleId);
      final response = await _client.login(
        form: LoginRequest(
            username: username,
            password: password,
            roleId: roleIds,
        ),
      );

      return Right(response.data);
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

  @override
  Future<Either<Failure, List<RoleDropDowns>>> getRoleDropDownsList() async {
    try {
      final response = await _client.roleDropDowns();
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


