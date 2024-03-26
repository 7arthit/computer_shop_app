import 'package:flutter/material.dart';

import 'package:computer_shop_app/src/presentation/widgets/button/app_button.dart';
import 'package:computer_shop_app/src/presentation/widgets/button/button.dart';
import 'package:computer_shop_app/src/presentation/pages/product/widget/product_Image.dart';
import 'package:computer_shop_app/src/utils/constants/app_theme.dart';
import 'package:computer_shop_app/src/domain/entities/product/product.dart';

class ProductDetailPage extends StatelessWidget {
  final Product? product;

  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appbar(context),
      body: _body(context),
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
            icon: const Icon(Icons.chevron_left, size: 28),
            onPressed: () {
              Navigator.pop(context);
            },
            color: AppTheme.white,
          ),
        ),
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
              _fullImageScreen(context, product?.image);
            },
            child: Hero(
              tag: 'product_image_${product?.id}',
              child: Image.network(
                product!.image,
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
                '฿${product?.unitPrice.toString().replaceAllMapped(
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
                'จำนวน ${product?.stock} ชิ้น',
                style: const TextStyle(fontSize: 22.0, color: Colors.red),
              ),
              const SizedBox(height: 4.0),
              Text(
                'ประเภทสินค้า  |  ${product?.productType.name}',
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
                product!.description.trim(),
                style: const TextStyle(
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(height: 20.0),
              _addProduct()
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
            product!.name,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _addProduct() {
    return Button(
      text: "เลือกสินค้า",
      style: AppButton.defaultButtonStyle,
      onPressed: () {},
    );
  }

  Future<void> _fullImageScreen(BuildContext context, imageUrl) async {
    await Navigator.of(context).push(MaterialPageRoute<String>(
      builder: (context) => ProductImage(context, imageUrl: imageUrl),
      fullscreenDialog: true,
    ));
  }
}
