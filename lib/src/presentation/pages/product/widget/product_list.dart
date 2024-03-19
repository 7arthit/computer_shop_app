import 'package:flutter/material.dart';

import 'package:computer_shop_app/src/domain/entities/product/product.dart';

class ProductList extends StatelessWidget {
  final List<Product> products;

  const ProductList({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return Card(
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
              'Price: ${product.name}',
              style: const TextStyle(fontSize: 14),
            ),
            subtitle: Text(
              '฿${product.unitPrice}',
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                  fontSize: 14,
              ),
            ),
          ),
        );
      },
    );
  }
}
