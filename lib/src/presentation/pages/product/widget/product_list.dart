import 'package:flutter/material.dart';

import 'package:computer_shop_app/src/domain/entities/product/product.dart';
import 'package:computer_shop_app/src/presentation/pages/product/widget/product_detail.dart';

class ProductList extends StatelessWidget {
  final List<Product> products;

  const ProductList({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailPage(product: product),
              ),
            );
          },
          child: Card(
            color: Colors.white,
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
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
                    color: Colors.white,
                  );
                },
              ),
              title: Text(
                product.name,
                style: const TextStyle(fontSize: 16),
              ),
              subtitle: Text(
                '฿${product.unitPrice.toString().replaceAllMapped(
                      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                      (Match m) => '${m[1]},',
                    )}',
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
