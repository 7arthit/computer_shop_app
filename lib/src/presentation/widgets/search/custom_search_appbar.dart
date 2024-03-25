import 'dart:io';
import 'package:computer_shop_app/src/presentation/pages/product/bloc/product_cubit.dart';
import 'package:computer_shop_app/src/presentation/widgets/text/text_input_form.dart';
import 'package:computer_shop_app/src/utils/constants/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomSearchAppBar({
    Key? key,
    required this.appBarHeight,
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
    return FutureBuilder(
      future: context.read<ProductCubit>().getDataList(),
      builder: (context, snapshot) {
        return BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            return state.products.isEmpty
                ? AppBar(
              toolbarHeight: appBarHeight,
              leading: canBack ? iconBack : null,
              leadingWidth: iconBackWidth,
              title: canBack ? null : TextInputForm(
                controller: controller,
                icon: const Icon(Icons.search, color: Colors.grey),
                suffixIcon: Visibility(
                  visible: controller.text.isNotEmpty,
                  child: IconButton(
                    onPressed: () {
                      controller.clear();
                      onClear?.call();
                    },
                    icon: const Icon(Icons.cancel, color: Colors.grey),
                  ),
                ),
                onChanged: (searchText) {
                  onSearchChanged?.call(searchText);
                },
                hintText: 'ค้นหาสินค้า',
                hintStyle: TextStyle(
                  fontSize: sizeFontWithDesityForDisplay(context, 20),
                ),
              ),
              actions: canActions ? iconActions : [
                Container(
                  margin: const EdgeInsets.only(right: 14.0),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppTheme.white,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.shopping_cart_outlined, size: 26),
                    onPressed: () {},
                    color: AppTheme.red,
                  ),
                ),
              ],
              centerTitle: true,
              backgroundColor: color,
              foregroundColor: Colors.transparent,
              elevation: 0.0,
            )
                : PreferredSize(
              preferredSize: const Size.fromHeight(0.0),
              child: AppBar(backgroundColor: AppTheme.red),
            );
          },
        );
      },
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}
