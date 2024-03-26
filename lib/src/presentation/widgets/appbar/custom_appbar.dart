import 'dart:io';
import 'package:flutter/material.dart';

import 'package:computer_shop_app/src/utils/constants/app_theme.dart';
import 'package:computer_shop_app/src/presentation/widgets/text/text_label.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.appBarHeight = 64,
    this.iconBackColor = Colors.white,
    this.backgroundColor = AppTheme.red,
  });
  final double appBarHeight;
  final String title;
  final Color iconBackColor;
  final Color backgroundColor;

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
      leading: Navigator.of(context).canPop()
          ? IconButton(
        icon: Icon(Icons.chevron_left, color: iconBackColor),
        onPressed: () => Navigator.of(context).pop(),
      ) : const SizedBox(),
      title: TextLabel(
        color: AppTheme.white,
        text: title,
        fontSize: sizeFontWithDesityForDisplay(context, 24),
      ),
      centerTitle: true,
      backgroundColor: backgroundColor,
      elevation: 0.0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}

