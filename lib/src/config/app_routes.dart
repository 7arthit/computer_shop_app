import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:computer_shop_app/src/utils/injection.dart';
import 'package:provider/single_child_widget.dart';

import 'package:computer_shop_app/src/presentation/pages/product/bloc/product_cubit.dart';
import 'package:computer_shop_app/src/presentation/pages/product/product.dart';
import 'package:computer_shop_app/src/presentation/pages/profile/profile.dart';
import 'package:computer_shop_app/src/presentation/pages/app/app.dart';
import 'package:computer_shop_app/src/presentation/pages/landing/landing.dart';
import 'package:computer_shop_app/src/presentation/widgets/bottombar/bloc/bottom_bar_cubit.dart';

class RouteNames {
  static const String landing = "/";
  static const String app = "/app";
  static const String home = "/home";
  static const String profile = "/profile";
}

final routes = <String, WidgetBuilder>{
  RouteNames.landing: (context) => const LandingPage(),
  RouteNames.app: (context) => const AppPage(),
  RouteNames.home: (context) => const ProductPage(),
  RouteNames.profile: (context) => const ProfilePage(),
};

final providers = <SingleChildWidget>[
  BlocProvider(create: (context) => getIt<BottomBarCubit>()),
  BlocProvider(create: (context) => getIt<ProductCubit>()),
];
