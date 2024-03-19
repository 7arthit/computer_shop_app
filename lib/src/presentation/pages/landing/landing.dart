import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:computer_shop_app/src/utils/constants/app_theme.dart';
import 'package:computer_shop_app/src/config/app_routes.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 100), () {
      Navigator.of(context).pushReplacementNamed(RouteNames.app);
      FlutterNativeSplash.remove();
    });

    return const Scaffold(
      body: Center(
        child: Center(child: CircularProgressIndicator(color: AppTheme.red)),
      ),
    );
  }
}
