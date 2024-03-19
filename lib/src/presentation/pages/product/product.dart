import 'package:computer_shop_app/src/utils/constants/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:computer_shop_app/src/presentation/pages/product/widget/product_list.dart';
import 'package:computer_shop_app/src/presentation/widgets/search/custom_search_appbar.dart';
import 'package:computer_shop_app/src/presentation/pages/product/bloc/product_cubit.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<ProductCubit>().loadProducts(),
      builder: (context, snapshot) {
        return Scaffold(
          appBar: CustomSearchAppBar(),
          body: BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              return state.isLoading
                  ? const Center(child: CircularProgressIndicator(color: AppTheme.red))
                  : state.products.isEmpty
                  ? _message()
                  : ProductList(products: state.products);
            },
          ),
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
            'ไม่มีการแจ้งเตือน',
            style: TextStyle(fontSize: 20, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
