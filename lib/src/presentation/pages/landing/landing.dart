import 'package:computer_shop_app/src/config/app_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:computer_shop_app/src/utils/constants/app_theme.dart';
import 'package:computer_shop_app/src/config/app_routes.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LandingState();
}

class _LandingState extends State<LandingPage> {
  final storage = AppStorage.shared;
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 100), () => checkAuthen());
  }

  Future checkAuthen() async {
    final token = await storage.getToken();

    Future.delayed(Duration.zero, () {

      if (token == null) {
        Navigator.of(context).pushReplacementNamed(RouteNames.auth);
      } else {
        Navigator.of(context).pushReplacementNamed(RouteNames.app);
      }

      FlutterNativeSplash.remove();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Center(child: CircularProgressIndicator(color: AppTheme.black)),
      ),
    );
  }
}

