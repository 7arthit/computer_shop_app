part of 'login_cubit.dart';

final class LoginState extends Equatable {
  const LoginState({
    this.status = FormzSubmissionStatus.initial,
    this.username = const Username.pure(),
    this.password = const Password.pure(),
    this.roleId = const RoleId.pure(),
    this.isValid = false,
    this.passwordObscured = true,
    this.errorText,
    this.errorRole,
    this.roleItems = const [],
  });

  final FormzSubmissionStatus status;
  final Username username;
  final Password password;
  final RoleId roleId;
  final bool isValid;
  final bool passwordObscured;
  final String? errorText;
  final String? errorRole;
  final List<RoleDropDowns> roleItems;

  LoginState copyWith({
    FormzSubmissionStatus? status,
    Username? username,
    Password? password,
    RoleId? roleId,
    bool? isValid,
    bool? passwordObscured,
    String? errorText,
    String? errorRole,
    ValueGetter? errorTextFunc,
    ValueGetter? errorRoleFunc,
    List<RoleDropDowns>? roleItems,
  }) {
    return LoginState(
      status: status ?? this.status,
      username: username ?? this.username,
      password: password ?? this.password,
      roleId: roleId ?? this.roleId,
      isValid: isValid ?? this.isValid,
      passwordObscured: passwordObscured ?? this.passwordObscured,
      errorText: errorTextFunc != null ? errorTextFunc() : errorText ?? this.errorText,
      errorRole: errorRoleFunc != null ? errorRoleFunc() : errorRole ?? this.errorRole,
      roleItems: roleItems ?? this.roleItems
    );
  }

  @override
  List<Object> get props => [status, username, password, roleId, passwordObscured, roleItems];
}
