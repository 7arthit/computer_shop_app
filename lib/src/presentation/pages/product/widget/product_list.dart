import 'package:flutter/material.dart';

import 'package:computer_shop_app/src/domain/entities/product/product.dart';
import 'package:computer_shop_app/src/presentation/pages/product/widget/product_detail.dart';

class ProductList extends StatefulWidget {
  final List<Product> products;

  const ProductList({Key? key, required this.products}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  String? selectedCategory;
  bool isListView = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _typeMenu(),
        Expanded(
          child: _productList(),
        ),
      ],
    );
  }

  Widget _typeMenu() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Align(
            alignment: Alignment.topRight,
            child: PopupMenuButton<String>(
              color: Colors.red,
              offset: const Offset(100, 8),
              onSelected: (String value) {
                setState(() {
                  selectedCategory = value;
                });
              },
              itemBuilder: (BuildContext context) {
                List<PopupMenuEntry<String>> items = [
                  const PopupMenuItem<String>(
                    value: 'ทั้งหมด',
                    child: Text('ทั้งหมด',
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                ];
                items.addAll(
                  [
                    'ซีพียู คอมพิวเตอร์',
                    'เมนบอร์ด',
                    'การ์ดแสดงผล',
                    'แรมสำหรับคอมพิวเตอร์',
                    'เคสและเพาเวอร์ซัพพลาย',
                    'เครื่องอ่านและบันทึกแผ่นซีดี',
                    'เครื่องอ่านเม็มโมรี่การ์ด',
                    'Single Board Computer',
                    'Bundle Pack',
                    'Combo Set',
                  ].map(
                    (String value) {
                      return PopupMenuItem<String>(
                        value: value,
                        child: Text(value,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 18)),
                      );
                    },
                  ),
                );
                return items;
              },
              child: ListTile(
                title: Text(selectedCategory ?? 'เลือกประเภทสินค้า'),
                trailing: const Icon(Icons.arrow_drop_down),
              ),
            ),
          ),
        ),
        _viewListViwe()
      ],
    );
  }

  Widget _viewListViwe() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 6.0),
          child: TextButton(
            onPressed: () {
              setState(() {
                isListView = !isListView;
              });
            },
            child: isListView
                ? const Icon(Icons.grid_view, color: Colors.red)
                : const Icon(Icons.list_alt, color: Colors.red),
          ),
        ),
      ],
    );
  }

  Widget _productList() {
    List<Product> filteredProducts = [];
    if (selectedCategory == null || selectedCategory == 'ทั้งหมด') {
      filteredProducts = widget.products;
    } else {
      filteredProducts = widget.products
          .where((product) => product.productType.name == selectedCategory)
          .toList();
    }

    return filteredProducts.isEmpty
        ? _message()
        : isListView
            ? ListView.builder(
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  final product = filteredProducts[index];
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
                      color: Colors.white,
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
              )
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  final product = filteredProducts[index];
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
                      color: Colors.white,
                      margin: const EdgeInsets.symmetric(horizontal: 10.0),
                      elevation: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            product.image,
                            width: double.infinity,
                            height: 120.0,
                            fit: BoxFit.contain,
                            errorBuilder: (
                              BuildContext context,
                              Object exception,
                              StackTrace? stackTrace,
                            ) {
                              return Container(
                                width: double.infinity,
                                height: 120.0,
                                color: Colors.white,
                              );
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.name.length > 23
                                      ? '${product.name.substring(0, 23)}...'
                                      : product.name,
                                  style: const TextStyle(fontSize: 16),
                                ),
                                Text(
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
                              ],
                            ),
                          ),
                        ],
                      ),
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
            'ไม่มีสินค้าในประเภทนี้',
            style: TextStyle(fontSize: 20, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
