import 'package:flutter/material.dart';

import 'package:computer_shop_app/src/presentation/pages/product/widget/product_Image_screen.dart';
import 'package:computer_shop_app/src/utils/constants/app_theme.dart';
import 'package:computer_shop_app/src/domain/entities/product/product.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appbar(context),
      body: _body(context),
      floatingActionButton: _addProductToCart(context),
    );
  }

  PreferredSizeWidget _appbar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: AppBar(
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        leading: Container(
          margin: const EdgeInsets.only(left: 14.0),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppTheme.red,
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, size: 28),
            onPressed: () {
              Navigator.pop(context);
            },
            color: AppTheme.white,
          ),
        ),
        actions: [
          _appBarAction(Icons.share_outlined, () {}),
          _appBarAction(Icons.shopping_cart_outlined, () {}),
        ],
      ),
    );
  }

  Widget _appBarAction(IconData iconData, VoidCallback onPressed) {
    return Container(
      margin: const EdgeInsets.only(right: 10.0),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppTheme.red,
      ),
      child: IconButton(
        icon: Icon(iconData, size: 26),
        onPressed: onPressed,
        color: AppTheme.white,
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              _fullImageScreen(context, product.image);
            },
            child: Hero(
              tag: 'product_image_${product.id}',
              child: Image.network(
                product.image,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '฿${product.unitPrice.toString().replaceAllMapped(
                      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                      (Match m) => '${m[1]},',
                    )}',
                style: const TextStyle(
                  fontSize: 28.0,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              _likeProduct(),
              const SizedBox(height: 4.0),
              Text(
                'จำนวน ${product.stock} ชิ้น',
                style: const TextStyle(fontSize: 22.0, color: Colors.red),
              ),
              const SizedBox(height: 4.0),
              Text(
                'ประเภทสินค้า  |  ${product.productType.name}',
                style: const TextStyle(
                  fontSize: 22.0,
                ),
              ),
              const SizedBox(height: 8.0),
              const Text(
                'คุณสมบัติสินค้า',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 2.0),
              Text(
                product.description.trim(),
                style: const TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _likeProduct() {
    return Row(
      children: [
        Expanded(
          child: Text(
            product.name,
            style: const TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Icon(Icons.favorite_border, color: Colors.red),
      ],
    );
  }

  Widget _addProductToCart(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {},
      icon: const Icon(Icons.add_shopping_cart_outlined,
          color: Colors.white, size: 18),
      label: const Text(
        'หยิบใส่ตะกร้า',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      backgroundColor: AppTheme.red,
      elevation: 0.5,
    );
  }

  Future<void> _fullImageScreen(BuildContext context, imageUrl) async {
    await Navigator.of(context).push(MaterialPageRoute<String>(
      builder: (context) => ImageScreenPage(context, imageUrl: imageUrl),
      fullscreenDialog: true,
    ));
  }
}
