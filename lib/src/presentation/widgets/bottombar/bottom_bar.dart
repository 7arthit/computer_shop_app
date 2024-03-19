import 'package:computer_shop_app/src/utils/constants/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:computer_shop_app/src/presentation/widgets/bottombar/bloc/bottom_bar_cubit.dart';
import 'package:computer_shop_app/src/presentation/widgets/bottombar/models/bottom_models.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key, this.onTap}) : super(key: key);

  final Function(int index)? onTap;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<BottomBarCubit>().loadMenuItems(),
      builder: (context, snapshot) {
        return BlocBuilder<BottomBarCubit, BottomBarState>(
          builder: (context, state) {
            return BottomNavigationBar(
              items: List.generate(state.menuItems.length, (index) {
                final item = state.menuItems[index];
                return _generateItem(context, item);
              }),
              type: BottomNavigationBarType.fixed,
              currentIndex: state.menuItems.indexWhere((item) {
                return item.menu == state.current;
              }),
              selectedItemColor: AppTheme.blue,
              unselectedItemColor: Colors.grey,
              selectedFontSize: 16,
              unselectedFontSize: 16,
              onTap: (index) {
                final item = state.menuItems[index];
                context.read<BottomBarCubit>().tabBarChanged(item.menu);
                onTap?.call(index);
              },
            );
          },
        );
      },
    );
  }

  BottomNavigationBarItem _generateItem(
      BuildContext context, BottomBarItem item) {
    return BottomNavigationBarItem(
      icon: SizedBox(
        height: 24,
        width: 24,
        child: _getIcon(context, item),
      ),
      label: item.text,
    );
  }

  Widget? _getIcon(BuildContext context, BottomBarItem item) {
    final state = context.watch<BottomBarCubit>().state;
    if (item.menu == BottomMenu.home) {
      return Icon(
        Icons.home,
        color: state.current == BottomMenu.home
            ? AppTheme.blue
            : Colors.grey,
      );
    }

    if (item.menu == BottomMenu.profile) {
      return Icon(
        Icons.person,
        color: state.current == BottomMenu.profile
            ? AppTheme.blue
            : Colors.grey,
      );
    }
    return null;
  }
}
