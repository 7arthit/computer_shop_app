import 'package:computer_shop_app/src/data/data_models/response/login_response.dart';
import 'package:dartz/dartz.dart';

import 'package:computer_shop_app/src/domain/entities/role/role_drop_downs.dart';
import 'package:computer_shop_app/src/data/data_sources/helper/failure.dart';

abstract class AuthenticationRepository {

  Future<Either<Failure, LoginResponse>> login({
    required String username,
    required String password,
    required String roleId,
  });

  Future<Either<Failure, List<RoleDropDowns>>> getRoleDropDownsList();
}
