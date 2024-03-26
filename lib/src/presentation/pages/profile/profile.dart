import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:computer_shop_app/src/config/app_routes.dart';
import 'package:computer_shop_app/src/config/app_storage.dart';
import 'package:computer_shop_app/src/presentation/pages/login/bloc/login_cubit.dart';
import 'package:computer_shop_app/src/presentation/widgets/appbar/custom_appbar.dart';
import 'package:computer_shop_app/src/presentation/widgets/text/text_label.dart';
import 'package:computer_shop_app/src/utils/constants/app_theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      backgroundColor: AppTheme.white,
      appBar: CustomAppBar(title: 'โปรไฟล์'),
      body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
       SizedBox(height: 8),
       Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Card(
            color: Colors.white,
            surfaceTintColor: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _LogoutButton(),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
    );
  }
}

class _LogoutButton extends StatelessWidget {
  const _LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _clearAppState(context);
        Navigator.of(context).pushNamedAndRemoveUntil(
          RouteNames.auth,
              (route) => false,
        );
      },
      child: Container(
        height: 42,
        width: double.infinity,
        color: Colors.white,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8),
        child: const Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.assignment_return_outlined, color: AppTheme.red,
                size: 24),
            SizedBox(width: 8),
            TextLabel(text: "ออกจากระบบ"),
          ],
        ),
      ),
    );}
  }

  Future<void> _clearAppState(BuildContext context) async {
    context.read<LoginCubit>().reset();
    await AppStorage.shared.setToken(null);
  }
