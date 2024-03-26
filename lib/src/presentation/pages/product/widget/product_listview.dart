import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:computer_shop_app/src/domain/entities/product/product.dart';
import 'package:computer_shop_app/src/presentation/widgets/text/mesage.dart';
import 'package:computer_shop_app/src/utils/constants/app_theme.dart';
import 'package:computer_shop_app/src/presentation/pages/product/bloc/product_cubit.dart';
import 'package:computer_shop_app/src/domain/entities/search/search.dart';
import 'package:computer_shop_app/src/presentation/pages/product/widget/product_detail.dart';

class ProductListView extends StatelessWidget {
  final Search? products;

  const ProductListView({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (BuildContext context, ProductState state) {
        List<Product> searchProducts = state.searchProducts?.result ?? [];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: searchProducts.isEmpty
                  ? const Message(message: 'ไม่พบสินค้า')
                  : ListView.builder(
                      itemCount: searchProducts.length,
                      itemBuilder: (context, index) {
                        final product = searchProducts[index];
                        return InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ProductDetailPage(product: product),
                              ),
                            );
                          },
                          child: Card(
                            color: AppTheme.white,
                            margin: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 16.0),
                            elevation: 0,
                            child: ListTile(
                              leading: Image.network(
                                product.image,
                                width: 60.0,
                                height: 60.0,
                                fit: BoxFit.cover,
                                errorBuilder: (
                                  BuildContext context,
                                  Object exception,
                                  StackTrace? stackTrace,
                                ) {
                                  return Container(
                                    width: 60.0,
                                    height: 60.0,
                                    color: AppTheme.white,
                                  );
                                },
                              ),
                              title: Text(
                                product.name ?? '',
                                style: const TextStyle(fontSize: 16),
                              ),
                              subtitle: Text(
                                '฿${product.unitPrice?.toString().replaceAllMapped(
                                      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                      (Match m) => '${m[1]},',
                                    )}',
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  color: AppTheme.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        );
      },
    );
  }
}
