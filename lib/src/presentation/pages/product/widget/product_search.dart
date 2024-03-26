import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:computer_shop_app/src/presentation/pages/product/bloc/product_cubit.dart';
import 'package:computer_shop_app/src/presentation/pages/product/widget/product_dropdowns.dart';
import 'package:computer_shop_app/src/presentation/pages/product/widget/product_listview.dart';
import 'package:computer_shop_app/src/utils/constants/app_theme.dart';

class ProductSearch extends StatelessWidget {
  const ProductSearch({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<ProductCubit>().getSearchDataList(),
      builder: (context, snapshot) {
        return Container(
          color: AppTheme.white,
          child: BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const ProductDropDowns(),
                  Expanded(
                    child: ProductListView(
                        products: state.searchProducts,
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}