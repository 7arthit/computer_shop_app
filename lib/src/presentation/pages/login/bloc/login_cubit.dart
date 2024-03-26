import 'package:flutter/foundation.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:injectable/injectable.dart';

import 'package:computer_shop_app/src/config/app_storage.dart';
import 'package:computer_shop_app/src/presentation/pages/login/models/login_models.dart';
import 'package:computer_shop_app/src/data/data_sources/helper/failure.dart';
import 'package:computer_shop_app/src/domain/entities/role/role_drop_downs.dart';
import 'package:computer_shop_app/src/domain/usecase/authentication_usecase.dart';

part 'login_state.dart';

@Injectable()
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.useCase) : super(const LoginState());

  @FactoryMethod()
  final AuthenticationUseCase useCase;

  void userNameChanged(String value) {
    final username = Username.dirty(value);
    emit(
      state.copyWith(
        username: username,
        errorTextFunc: () => null,
        isValid: Formz.validate([state.password, username]),
      ),
    );
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(
      state.copyWith(
        password: password,
        errorTextFunc: () => null,
        isValid: Formz.validate([password, state.username]),
      ),
    );
  }

  void passwordObscureChanged() {
    emit(state.copyWith(passwordObscured: !state.passwordObscured));
  }

  void roleDropdownItems() async {
    final result = await useCase.getRoleDropDownsList();
    result.fold(
          (failure) {
            emit(state.copyWith(status: FormzSubmissionStatus.failure));
      },
          (data) {
        emit(
            state.copyWith(
                roleItems: data,
            ),
        );
      },
    );
  }

  void updateSelectedRole(int? selectedRole) {
    if (selectedRole != null) {
      String selectedRoleIdstr = selectedRole.toString();
      final roleId = RoleId.dirty(selectedRoleIdstr);
      emit(
        state.copyWith(
            roleId: roleId,
            errorTextFunc: () => null,
            isValid: Formz.validate([roleId, state.roleId]),
        ),
      );
    }
  }

  Future<void> submitted() async {
    if (state.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      try {
        final result = await useCase.login(LoginParams(
          state.username.value,
          state.password.value,
          state.roleId.value,
        ));
        print(state.roleId);
        result.fold(
          (failure) {
            var message = failure.message;
            if (failure is ServerFailure) {
              message = failure.message;
            } else if (failure.errors != null && failure.errors!.isNotEmpty) {
              message = failure.errors![0].message;
            }
            emit(state.copyWith(
              errorText: message,
              errorRole: message,
              status: FormzSubmissionStatus.failure,
            ));
          },
          (data) {
            AppStorage.shared.setToken(data.token);
            emit(state.copyWith(status: FormzSubmissionStatus.success));
          },
        );
      } catch (_) {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    }
  }

  Future<void> upadteStatus(FormzSubmissionStatus status) async {
    emit(state.copyWith(status: status, errorTextFunc: () => null));
  }

  Future<void> reset() async {
    emit(const LoginState());
  }
}
