import 'package:computer_shop_app/src/presentation/pages/product/widget/product_list_search.dart';
import 'package:computer_shop_app/src/presentation/widgets/search/custom_search_appbar.dart';
import 'package:computer_shop_app/src/utils/constants/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:computer_shop_app/src/presentation/pages/product/bloc/product_cubit.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<ProductCubit>().getDataList(),
      builder: (context, snapshot) {
        return BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: AppTheme.white,
              appBar: CustomSearchAppBar(appBarHeight: state.products.isEmpty ? 64 : -0),
              body: state.isLoading
                  ? _message()
                  : state.products.isEmpty
                  ? const Center(child: CircularProgressIndicator(color: AppTheme.red))
                  : const Stack(children: <Widget>[ProductListSearch()],
              ),
            );
          },
        );
      },
    );
  }

  Widget _message() {
    return Container(
      alignment: Alignment.center,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, color: Colors.grey, size: 32),
          SizedBox(width: 10, height: 10),
          Text(
            'ไม่มีสินค้า',
            style: TextStyle(fontSize: 20, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
