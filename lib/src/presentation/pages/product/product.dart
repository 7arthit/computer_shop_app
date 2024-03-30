import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:computer_shop_app/src/presentation/pages/product/bloc/product_cubit.dart';
import 'package:computer_shop_app/src/presentation/pages/product/widget/product_search.dart';
import 'package:computer_shop_app/src/presentation/widgets/search/custom_search_appbar.dart';
import 'package:computer_shop_app/src/utils/constants/app_theme.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<ProductCubit>().getDataList(),
      builder: (context, snapshot) {
        return Scaffold(
          backgroundColor: AppTheme.white,
          appBar: CustomSearchAppBar(),
          body: Stack(
            children: <Widget>[
              _body(),
            ],
          ),
        );
      },
    );
  }

  Widget _body() {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (BuildContext context, ProductState state) {
        if (!state.canSearch) {
          return const ProductSearch();
        } else {
          return state.showProducts
              ? const ProductSearch()
              : const ProductSearch();
        }
      },
    );
  }
}
