import 'package:flutter/material.dart';

import 'package:computer_shop_app/src/presentation/pages/login/widgets/login_form.dart';
import 'package:computer_shop_app/src/presentation/widgets/appbar/custom_appbar.dart';
import 'package:computer_shop_app/src/utils/constants/app_theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  final String title = "เข้าสู่ระบบ";

  @override
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    FocusManager.instance.primaryFocus?.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: CustomAppBar(
          title: widget.title,
          iconBackColor: AppTheme.white,
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(
                      right: 16,
                      left: 16,
                      top: 16,
                      bottom: 16,
                    ),
                    child: LoginForm(),
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
