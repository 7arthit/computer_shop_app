import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:computer_shop_app/src/utils/injection.dart';
import 'package:provider/single_child_widget.dart';

import 'package:computer_shop_app/src/presentation/pages/sacn/scan.dart';
import 'package:computer_shop_app/src/presentation/pages/product/bloc/product_cubit.dart';
import 'package:computer_shop_app/src/presentation/pages/product/product.dart';
import 'package:computer_shop_app/src/presentation/pages/profile/profile.dart';
import 'package:computer_shop_app/src/presentation/pages/app/app.dart';
import 'package:computer_shop_app/src/presentation/pages/landing/landing.dart';
import 'package:computer_shop_app/src/presentation/widgets/bottombar/bloc/bottom_bar_cubit.dart';
import 'package:computer_shop_app/src/presentation/pages/auth/auth.dart';
import 'package:computer_shop_app/src/presentation/pages/login/bloc/login_cubit.dart';
import 'package:computer_shop_app/src/presentation/pages/login/login.dart';
import 'package:computer_shop_app/src/presentation/pages/product_order/bloc/product_order_cubit.dart';
import 'package:computer_shop_app/src/presentation/pages/product_order_history/bloc/product_order_history_cubit.dart';

class RouteNames {
  static const String landing = "/";
  static const String app = "/app";
  static const String auth = "/auth";
  static const String login = "/login";
  static const String home = "/home";
  static const String profile = "/profile";
  static const String scan = "/scan";
}

final routes = <String, WidgetBuilder>{
  RouteNames.landing: (context) => const LandingPage(),
  RouteNames.app: (context) => const AppPage(),
  RouteNames.auth: (context) => const AuthPage(),
  RouteNames.login: (context) => const LoginPage(),
  RouteNames.home: (context) => const ProductPage(),
  RouteNames.profile: (context) => const ProfilePage(),
  RouteNames.scan: (context) => const ScanPage(),
};

final providers = <SingleChildWidget>[
  BlocProvider(create: (context) => getIt<BottomBarCubit>()),
  BlocProvider(create: (context) => getIt<ProductCubit>()),
  BlocProvider(create: (context) => getIt<ProductOrderCubit>()),
  BlocProvider(create: (context) => getIt<ProductOrderHistoryCubit>()),
  BlocProvider(create: (context) => getIt<LoginCubit>()),
];
