import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:computer_shop_app/src/presentation/pages/profile/profile.dart';
import 'package:computer_shop_app/src/presentation/widgets/bottombar/bloc/bottom_bar_cubit.dart';
import 'package:computer_shop_app/src/presentation/widgets/bottombar/bottom_bar.dart';
import 'package:computer_shop_app/src/presentation/widgets/bottombar/models/bottom_models.dart';
import 'package:computer_shop_app/src/presentation/pages/product/product.dart';

class AppPage extends StatefulWidget {
  const AppPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<AppPage> {
  final _controller = PageController(keepPage: false, initialPage: 0);

  final Map<BottomMenu, Widget> _pages = {
    BottomMenu.home: const ProductPage(),
    BottomMenu.profile: const ProfilePage(),
  };

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const BottomBar(),
        body: BlocBuilder<BottomBarCubit, BottomBarState>(
          builder: (context, state) {
            return PageView.builder(
              controller: _controller,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.menuItems.length,
              itemBuilder: (context, index) {
                return _pages[state.current];
              },
            );
          },
        ),
    );
  }
}
