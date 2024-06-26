import 'package:formz/formz.dart';

enum UsernameValidationError { empty }

class Username extends FormzInput<String, UsernameValidationError> {
  const Username.pure() : super.pure('');
  const Username.dirty([super.value = '']) : super.dirty();

  @override
  UsernameValidationError? validator(String value) {
    if (value.isEmpty) return UsernameValidationError.empty;
    return null;
  }
}

enum PasswordValidationError { empty }

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure('');
  const Password.dirty([super.value = '']) : super.dirty();

  @override
  PasswordValidationError? validator(String value) {
    if (value.isEmpty) return PasswordValidationError.empty;
    return null;
  }
}

enum RoleIdValidationError { empty }

class RoleId extends FormzInput<String, RoleIdValidationError> {
  const RoleId.pure() : super.pure('1');
  const RoleId.dirty([super.value = '']) : super.dirty();

  @override
  RoleIdValidationError? validator(String value) {
    if (value.isEmpty) return RoleIdValidationError.empty;
    return null;
  }
}
