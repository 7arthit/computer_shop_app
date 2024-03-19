import 'dart:io';
import 'package:computer_shop_app/src/presentation/widgets/text/text_input_form.dart';
import 'package:computer_shop_app/src/utils/constants/app_theme.dart';
import 'package:flutter/material.dart';

class CustomSearchAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  CustomSearchAppBar({
    super.key,
    this.appBarHeight = 64,
    this.canBack = false,
    this.iconBack,
    this.canActions = false,
    this.iconActions,
    this.iconBackWidth = 28,
    this.iconBackColor = Colors.white,
    this.color = AppTheme.red,
    this.onSearchChanged,
    this.onClear,
  });

  final double appBarHeight;
  final bool canBack;
  final Widget? iconBack;
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
      leading: canBack ? iconBack : null,
      leadingWidth: iconBackWidth,
      title: canBack ? null
          : TextInputForm(
        controller: controller,
        icon: const Icon(Icons.search, color: Colors.grey),
        suffixIcon: IconButton(
          onPressed: () {
            controller.clear();
            onClear?.call();
          },
          icon: const Icon(Icons.cancel, color: Colors.grey),
        ),
        onChanged: (searchText) {
          onSearchChanged?.call(searchText);
        },
        hintText: 'ค้นหาสินค้า',
        hintStyle: TextStyle(
          fontSize: sizeFontWithDesityForDisplay(context, 20),
        ),
      ),
      centerTitle: true,
      backgroundColor: color,
      foregroundColor: Colors.transparent,
      elevation: 0.0,
      actions: canActions ? iconActions : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}
