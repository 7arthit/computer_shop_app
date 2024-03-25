import 'package:computer_shop_app/src/presentation/pages/product/bloc/product_cubit.dart';
import 'package:computer_shop_app/src/presentation/pages/product/widget/product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductListSearch extends StatelessWidget {
  const ProductListSearch({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: BlocConsumer<ProductCubit, ProductState>(
        listener: (context, state) {},
        builder: (context, state) {
            return state.products.isNotEmpty
                ? ProductList(products: state.products)
                : _message();
        },
      ),
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
            'ไม่พบสินค้า',
            style: TextStyle(fontSize: 20, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
