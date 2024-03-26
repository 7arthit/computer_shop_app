import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:computer_shop_app/src/presentation/pages/product/bloc/product_cubit.dart';
import 'package:computer_shop_app/src/presentation/widgets/text/text_input_form.dart';
import 'package:computer_shop_app/src/utils/constants/app_theme.dart';

class CustomSearchAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  CustomSearchAppBar({
    super.key,
    this.appBarHeight = 64,
    this.canActions = false,
    this.iconActions,
    this.iconBackWidth = 28,
    this.iconBackColor = Colors.white,
    this.color = AppTheme.red,
    this.onSearchChanged,
    this.onClear,
  });

  final double appBarHeight;
  final double iconBackWidth;
  final bool canActions;
  final List<Widget>? iconActions;
  final Color iconBackColor;
  final Color color;
  final Function(String?)? onSearchChanged;
  final Function()? onClear;

  final TextEditingController controller = TextEditingController();

  double sizeFontWithDesityForDisplay(BuildContext context, double size) {
    Size mediaSize = MediaQuery.of(context).size;
    double devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    double aspectRatio = mediaSize.aspectRatio;
    double font = ((size + 5) / (devicePixelRatio)) / aspectRatio;
    if (Platform.isIOS) {
      return aspectRatio > 0.5 ? size : font;
    } else {
      return size * .90;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: appBarHeight,
      leadingWidth: iconBackWidth,
      title:TextInputForm(
        controller: controller,
        icon: const Icon(Icons.search, color: Colors.grey),
        suffixIcon: IconButton(
          onPressed: () {
            controller.clear();
            onClear?.call();
            context.read<ProductCubit>().searchChanged('');
            context.read<ProductCubit>().reset();
          },
          icon: const Icon(Icons.cancel, color: Colors.grey),
        ),
        onChanged: (searchText) {
          onSearchChanged?.call(searchText);
          if (searchText!.isEmpty) {
            context.read<ProductCubit>().searchChanged(searchText);
          } else {
            context.read<ProductCubit>().searchChanged(searchText);
          }
        },
        hintText: 'ค้นหาสินค้า',
      ),
      centerTitle: true,
      backgroundColor: color,
      foregroundColor: Colors.transparent,
      elevation: 0.0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}