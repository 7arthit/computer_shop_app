import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import 'package:computer_shop_app/src/config/app_routes.dart';
import 'package:computer_shop_app/src/domain/entities/role/role_drop_downs.dart';
import 'package:computer_shop_app/src/presentation/pages/login/bloc/login_cubit.dart';
import 'package:computer_shop_app/src/presentation/widgets/button/app_button.dart';
import 'package:computer_shop_app/src/presentation/widgets/button/button.dart';
import 'package:computer_shop_app/src/presentation/widgets/text/text_input_form.dart';
import 'package:computer_shop_app/src/presentation/widgets/text/text_label.dart';
import 'package:computer_shop_app/src/utils/constants/app_theme.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status.isFailure) {
          final errorText = state.errorText ?? "ชื่อผู้ใช้ & รหัสผ่าน & ตำแหน่ง ไม่ถูกต้อง";
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(errorText)));
          context
              .read<LoginCubit>()
              .upadteStatus(FormzSubmissionStatus.initial);
        }
        if (state.status.isSuccess) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(RouteNames.app, (route) => false);
        }
      },
      child: Form(
        key: _formKey,
        child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _UsernameInput(),
              const Padding(padding: EdgeInsets.all(12)),
              _PasswordInput(),
              const Padding(padding: EdgeInsets.all(12)),
              _RoleDropDowns(),
              const Padding(padding: EdgeInsets.all(12)),
              _LoginButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _UsernameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) =>
          previous.username != current.username ||
          previous.errorText != current.errorText,
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextLabel(text: "ชื่อผู้ใช้"),
            TextInputForm(
              icon: const Icon(Icons.person, color: AppTheme.red),
              onChanged: (text) {
                context.read<LoginCubit>().userNameChanged(text ?? "");
              },
              errorText: state.username.displayError != null
                  ? 'กรุณาป้อน ชื่อผู้ใช้'
                  : null,
              border: state.errorText != null
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: AppTheme.red),
                    )
                  : null,
            ),
          ],
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) =>
          previous.password != current.password ||
          previous.passwordObscured != current.passwordObscured ||
          previous.errorText != current.errorText,
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextLabel(text: "รหัสผ่าน"),
            TextInputForm(
              icon: const Icon(Icons.lock, color: AppTheme.red),
              suffixIcon: InkWell(
                child: Icon(
                  state.passwordObscured
                      ? Icons.remove_red_eye_sharp
                      : Icons.remove_red_eye_outlined,
                  color: AppTheme.red,
                ),
                onTap: () {
                  context.read<LoginCubit>().passwordObscureChanged();
                },
              ),
              obscureText: state.passwordObscured,
              onChanged: (text) {
                context.read<LoginCubit>().passwordChanged(text ?? "");
              },
              errorText:
                  state.password.displayError != null || state.errorText != null
                      ? state.errorText ?? 'กรุณาป้อน รหัสผ่าน'
                      : null,
              border: state.errorText != null
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: AppTheme.red),
                    )
                  : null,
            ),
          ],
        );
      },
    );
  }
}

class _RoleDropDowns extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<LoginCubit>(context).roleDropdownItems();
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextLabel(text: "ตำแหน่ง"),
            SizedBox(
              width: double.infinity,
              child: DropdownButtonFormField<RoleDropDowns>(
                value: state.roleItems.isNotEmpty ? state.roleItems.first : null,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppTheme.transparent),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppTheme.transparent),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                ),
                items: state.roleItems.map((item) {
                  return DropdownMenuItem<RoleDropDowns>(
                    value: item,
                    child: Row(
                      children: [
                        const SizedBox(width: 2),
                        Icon(Icons.work, color: state.errorText != null ? AppTheme.black : AppTheme.red),
                        const SizedBox(width: 14),
                        Text(item.name, style: const TextStyle(fontSize: 18, color: Colors.black)),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  context.read<LoginCubit>().updateSelectedRole(value?.value);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Button(
          text: "เข้าสู่ระบบ",
          style: state.isValid
              ? AppButton.defaultButtonStyle
              : AppButton.disableButtonStyle,
          onPressed: () {
            if (!state.status.isInProgress) {
              context.read<LoginCubit>().submitted();
            }
          },
          child: state.status.isInProgress
              ? const SizedBox(
                  height: 24.0,
                  width: 24.0,
                  child: Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  ),
                )
              : null,
        );
      },
    );
  }
}
