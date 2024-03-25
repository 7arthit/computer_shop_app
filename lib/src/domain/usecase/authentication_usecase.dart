import 'package:computer_shop_app/src/data/data_sources/helper/failure.dart';
import 'package:computer_shop_app/src/domain/entities/login/login.dart';
import 'package:computer_shop_app/src/domain/entities/role_drop_downs/role_drop_downs.dart';
import 'package:computer_shop_app/src/domain/repositories/authentication_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';


@LazySingleton()
class AuthenticationUseCase {
  final AuthenticationRepository repo;

  AuthenticationUseCase(this.repo);

  Future<Either<Failure, Login>> login(LoginParams params) {
    return repo.login(username: params.username, password: params.password, roleId: params.roleId);
  }

  Future<Either<Failure, List<RoleDropDowns>>> getRoleDropDownsList() async {
    return repo.getRoleDropDownsList();
  }
}

class LoginParams {
  final String username;
  final String password;
  final String roleId;
  LoginParams(this.username, this.password, this.roleId);
}

