import 'package:flutter/material.dart';

import 'package:computer_shop_app/src/config/app_routes.dart';
import 'package:computer_shop_app/src/presentation/widgets/button/button_login.dart';
import 'package:computer_shop_app/src/utils/constants/app_theme.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AuthState();
}

class _AuthState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.red,
      body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 200),
                Image.asset(
                  'assets/images/ComShop1.png',
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 12.5 * 12.5,
                ),
                const SizedBox(height: 300),
                _loginButton,
              ],
            ),
          ),
    );
  }

  Widget get _loginButton {
    return Container(
      margin: const EdgeInsets.only(
        right: 16,
        left: 16,
        top: 8,
        bottom: 8,
      ),
      child: ButtonLogin(
        text: "เข้าสู่ระบบ",
        onPressed: () {
          Navigator.of(context).pushNamed(RouteNames.login);
        },
      ),
    );
  }
}
