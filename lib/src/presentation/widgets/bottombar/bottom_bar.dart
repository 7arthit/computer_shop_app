import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:computer_shop_app/src/utils/constants/app_theme.dart';
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
              backgroundColor: AppTheme.white,
              selectedItemColor: AppTheme.red,
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
        Icons.list_alt,
        color: state.current == BottomMenu.home
            ? AppTheme.red
            : Colors.grey,
      );
    }

    if (item.menu == BottomMenu.scan) {
      return Icon(
        Icons.qr_code_scanner_outlined,
        color: state.current == BottomMenu.scan
            ? AppTheme.red
            : Colors.grey,
      );
    }

    if (item.menu == BottomMenu.profile) {
      return Icon(
        Icons.person,
        color: state.current == BottomMenu.profile
            ? AppTheme.red
            : Colors.grey,
      );
    }
    return null;
  }
}
